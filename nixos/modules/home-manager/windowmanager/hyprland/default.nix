{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.hyprland;
  deviceCfg = config.deviceCfg;
in {
  options.hm-modules.windowmanager.hyprland = { enable = mkEnableOption "hyprland"; };

  config = mkIf cfg.enable {
    deviceCfg.isWayland = true;

    hm-modules.windowmanager.add-on.blueman-applet.enable = true;
    hm-modules.windowmanager.add-on.dunst.enable = true;
    hm-modules.windowmanager.add-on.gtk-theme.enable = true;
    hm-modules.windowmanager.add-on.nm-applet.enable = true;
    hm-modules.windowmanager.add-on.pasystray.enable = true;
    hm-modules.windowmanager.add-on.rofi.enable = true;
    hm-modules.windowmanager.add-on.swayidle.enable = true;
    hm-modules.windowmanager.add-on.swaylock.enable = true;
    hm-modules.windowmanager.add-on.waybar.enable = true;
    hm-modules.windowmanager.add-on.xdg.enable = true;
    hm-modules.terminal-emulator.alacritty.enable = true;

    assertions = [
      {
        assertion = length deviceCfg.monitors > 0;
        message = ''
          At least one monitor in the `config.deviceCfg.monitors` is
          needed to use Hyprland module.
        '';
      }
    ];

    xdg.configFile."hypr/wallpapers".source = ./wallpapers;
    xdg.configFile."hypr/sounds".source = ./sounds;

    wayland.windowManager.hyprland = {
      enable = true;
      settings = import ./config.nix { inherit lib pkgs deviceCfg; };
      # Submaps are impossible to be defined in settings
      extraConfig = ''
        # Resize window
        submap = $resize
        binde = , h, resizeactive, -10 0
        binde = , j, resizeactive, 0 10
        binde = , k, resizeactive, 0 -10
        binde = , l, resizeactive, 10 0
        # Or use arrow keys
        binde = , left, resizeactive, -10 0
        binde = , down, resizeactive, 0 10
        binde = , up, resizeactive, 0 -10
        binde = , right, resizeactive, 10 0
        # Return to normal mode
        bind = , escape, submap, reset
        submap = reset

        # Show log out menu
        submap = $system
        bind = , l, execr, $locker
        bind = , l, submap, reset
        bind = , e, exit,
        bind = , r, execr, systemctl reboot
        bind = , s, execr, systemctl poweroff -i
        bind = , f, execr, systemctl reboot --firmware-setup
        # Return to normal mode
        bind = , escape, submap, reset
        bind = , return, submap, reset
        submap = reset

        # Take a screenshot with grim, put it in Desktop folder
        submap = $screenshot
        bind = , return, execr, $grim_capture && pw-cat -p ~/.config/hypr/sounds/camera-shutter.oga && notify-send "Screenshot saved in your Desktop folder"
        bind = , return, submap, reset
        bind = , s, exec, $grim_region && pw-cat -p ~/.config/hypr/sounds/camera-shutter.oga && notify-send "Screenshot saved in your Desktop folder"
        bind = , s, submap, reset
        # Return to normal mode
        bind = , escape, submap, reset
        submap = reset
      '';
    };

    home.packages = with pkgs; [
      grim
      slurp
    ];
    systemd.user.startServices = "sd-switch";
  };
}
