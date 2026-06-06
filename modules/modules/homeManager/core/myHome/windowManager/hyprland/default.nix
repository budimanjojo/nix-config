{ myLib, ... }:
{
  flake.modules.homeManager.core =
    {
      config,
      osConfig ? { },
      hardware,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.myHome.windowManager.hyprland;
      systemEnabled = myLib.systemEnabled "mySystem.windowManager.hyprland.enable" osConfig;
    in
    {
      options.myHome.windowManager.hyprland = {
        enable = lib.mkEnableOption "Hyprland window manager";
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
            assertion = builtins.length hardware.monitors > 0;
            message = ''
              At least one monitor in the `config.myHardware.monitors` is
              needed to use Hyprland home-manager module.
            '';
          }
        ];

        wayland.windowManager.hyprland = {
          enable = true;
        }
        // (import ./_config {
          inherit
            hardware
            config
            lib
            pkgs
            ;
        });

        systemd.user.startServices = "sd-switch";
      };
    };
}
