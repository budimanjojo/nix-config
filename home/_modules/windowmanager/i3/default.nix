{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  myHardware = config.myHardware;
  cfg = config.myHome.windowmanager.i3;
  systemEnabled = lib.myLib.systemEnabled "mySystem.windowmanager.i3.enable" osConfig;
in
{
  options.myHome.windowmanager.i3 = {
    enable = lib.mkEnableOption "i3";
  };

  config = lib.mkIf (cfg.enable) {
    myHome = {
      isWayland = false;

      windowmanager.add-on = {
        blueman-applet.enable = true;
        dunst.enable = true;
        gtk-theme.enable = true;
        nm-applet.enable = true;
        rofi.enable = true;
        theme.tokyonight.enable = true;
        screenshotter.enable = true;
        pasystray.enable = true;
        picom.enable = true;
        py3status.enable = true;
        terminal-emulator.default = "contour";
        xdg.enable = true;
      };
    };

    warnings = lib.mkIf (!systemEnabled) [
      ''
        You have enabled i3 home-manager module but not the NixOS system module.
        Some things might not work properly.
      ''
    ];

    assertions = [
      {
        assertion = builtins.length myHardware.monitors > 0;
        message = ''
          At least one monitor in the `config.myHardware.monitors` is
          needed to use i3 home-manager module.
        '';
      }
    ];

    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = import ./config { inherit config pkgs lib; };
    };
  };
}
