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
    xdg.configFile."hypr/configs".source = ./configs;

    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = import ./config.nix { inherit lib pkgs; deviceCfg = deviceCfg; };
    };

    home.packages = with pkgs; [
      grim
      slurp
    ];
    systemd.user.startServices = "sd-switch";
  };
}
