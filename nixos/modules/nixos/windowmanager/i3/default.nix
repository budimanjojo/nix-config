{
  pkgs,
  lib,
  config,
  myPkgs,
  ...
}:
with lib;
let
  cfg = config.modules.windowmanager.i3;
  deviceCfg = config.deviceCfg;
in
{
  options.modules.windowmanager.i3 = {
    enable = mkEnableOption "i3";
  };

  config = mkIf cfg.enable {
    modules.windowmanager.add-on.blueman-applet.enable = true;
    modules.windowmanager.add-on.polkit-gnome.enable = true;
    modules.windowmanager.add-on.thunar.enable = true;

    modules.system.font.enable = true;
    modules.system.sound.enable = true;
    modules.system.video.enable = true;

    assertions = [
      {
        assertion = length deviceCfg.monitors > 0;
        message = ''
          At least one monitor in the `config.deviceCfg.monitors` is
          needed to use i3 module.
        '';
      }
    ];

    services.xserver = {
      enable = true;
      displayManager = {
        autoLogin.enable = true;
        defaultSession = "none+i3";
        sddm = {
          enable = true;
        };
      };
      desktopManager = {
        xterm.enable = false;
        runXdgAutostartIfNone = true;
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages =
          with pkgs;
          [
            feh
            numlockx
            picom
            rofi
            scrot
            (python3Packages.py3status.overrideAttrs (oldAttrs: {
              propagatedBuildInputs =
                with python3Packages;
                [
                  pytz
                  tzlocal
                ]
                ++ oldAttrs.propagatedBuildInputs;
            }))
            xdg-utils
            xfce.xfce4-power-manager
          ]
          ++ [ myPkgs.rofi-firefox-wrapper ];
      };
    };
    networking.networkmanager.enable = true;
    programs.dconf.enable = true;
  };
}
