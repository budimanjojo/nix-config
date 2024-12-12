{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}:
let
  myHardware = config.myHardware;
  cfg = config.myHome.windowmanager.hyprland;
  systemEnabled = lib.myLib.systemEnabled "mySystem.windowmanager.hyprland.enable" osConfig;
in
{
  options.myHome.windowmanager.hyprland = {
    enable = lib.mkEnableOption "Hyprland window manager";
  };

  config = lib.mkIf (cfg.enable) {
    myHome = {
      isWayland = true;

      windowmanager.add-on = {
        blueman-applet.enable = true;
        dunst.enable = true;
        gtk-theme.enable = true;
        nm-applet.enable = true;
        nwg-bar.enable = true;
        pasystray.enable = true;
        rofi.enable = true;
        swayidle.enable = true;
        waybar.enable = true;
        screenshotter.enable = true;
        terminal-emulator.default = "alacritty";
        xdg.enable = true;
      };
    };

    warnings = lib.mkIf (!systemEnabled) [
      ''
        You have enabled Hyprland home-manager module but not the NixOS system module.
        Some things might not work properly.
      ''
    ];

    assertions = [
      {
        assertion = builtins.length myHardware.monitors > 0;
        message = ''
          At least one monitor in the `config.myHardware.monitors` is
          needed to use Hyprland home-manager module.
        '';
      }
    ];

    wayland.windowManager.hyprland = {
      enable = true;
    } // (import ./config { inherit config lib pkgs; });

    systemd.user.startServices = "sd-switch";
  };
}
