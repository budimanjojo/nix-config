{ myLib, ... }:
{
  flake.modules.homeManager.core =
    {
      config,
      osConfig ? { },
      lib,
      hardware,
      pkgs,
      ...
    }:
    let
      cfg = config.myHome.windowManager.i3;
      systemEnabled = myLib.systemEnabled "mySystem.windowManager.i3.enable" osConfig;
    in
    {
      options.myHome.windowManager.i3 = {
        enable = lib.mkEnableOption "i3";
      };

      config = lib.mkIf (cfg.enable) {
        myHome = {
          isWayland = false;

          windowManager.add-on = {
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
            terminal-emulator.default = "wezterm";
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
            assertion = builtins.length hardware.monitors > 0;
            message = ''
              At least one monitor in the `config.myHardware.monitors` is
              needed to use i3 home-manager module.
            '';
          }
        ];

        xsession.windowManager.i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          config = import ./_config {
            inherit
              hardware
              config
              pkgs
              lib
              ;
          };
        };
      };
    };
}
