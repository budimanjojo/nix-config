{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}:
let
  myHardware = config.myHardware;
  cfg = config.myHome.windowmanager.sway;
  systemEnabled = lib.myLib.systemEnabled "mySystem.windowmanager.sway.enable" osConfig;
in
{
  options.myHome.windowmanager.sway = {
    enable = lib.mkEnableOption "sway";
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
        theme.tokyonight.enable = true;
        screenshotter.enable = true;
        swayidle.enable = true;
        waybar.enable = true;
        xdg.enable = true;
      };

      terminal-emulator.contour.enable = true;
    };

    warnings = lib.mkIf (!systemEnabled) [
      ''
        You have enabled Sway home-manager module but not the NixOS system module.
        Some things might not work properly.
      ''
    ];

    assertions = [
      {
        assertion = builtins.length myHardware.monitors > 0;
        message = ''
          At least one monitor in the `config.myHardware.monitors` is
          needed to use Sway home-manager module.
        '';
      }
    ];

    wayland.windowManager.sway = {
      enable = true;
      package = null; # use the system provided package
      config = import ./config { inherit config pkgs lib; };
    };

    home.sessionVariables = {
      XDG_CURRENT_DESKTOP = "sway";
      GTK_USE_PORTAL = "1";
    };
  };
}
