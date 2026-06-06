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
      cfg = config.myHome.windowManager.sway;
      systemEnabled = myLib.systemEnabled "mySystem.windowManager.sway.enable" osConfig;
    in
    {
      options.myHome.windowManager.sway = {
        enable = lib.mkEnableOption "sway";
      };

      config = lib.mkIf (cfg.enable) {
        myHome = {
          isWayland = true;

          windowManager.add-on = {
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
            terminal-emulator.default = "alacritty";
            waybar.enable = true;
            xdg.enable = true;
          };
        };

        warnings = lib.mkIf (!systemEnabled) [
          ''
            You have enabled Sway home-manager module but not the NixOS system module.
            Some things might not work properly.
          ''
        ];

        assertions = [
          {
            assertion = builtins.length hardware.monitors > 0;
            message = ''
              At least one monitor in the `hardware.monitors` is
              needed to use Sway home-manager module.
            '';
          }
        ];

        wayland.windowManager.sway = {
          enable = true;
          package = null; # use the system provided package
          config = import ./_config {
            inherit
              hardware
              config
              pkgs
              lib
              ;
          };
        };

        home.sessionVariables = {
          XDG_CURRENT_DESKTOP = "sway";
          GTK_USE_PORTAL = "1";
        };
      };
    };
}
