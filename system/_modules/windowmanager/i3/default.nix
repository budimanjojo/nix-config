{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mySystem.windowmanager.i3;
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    ;
in
{
  options.mySystem.windowmanager.i3 = {
    enable = mkEnableOption "i3 window manager";
    isDefaultSession = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf (cfg.enable) {
    mySystem = {
      isWayland = false;

      windowmanager.add-on = {
        blueman.enable = true;
        networkmanager.enable = true;
        polkit-gnome.enable = true;
        thunar.enable = true;
      };

      system = {
        font.enable = true;
        sound.enable = true;
        video.enable = true;
      };

      displaymanager.sddm = {
        enable = true;
        defaultSession = mkIf (cfg.isDefaultSession) "none+i3";
      };
    };

    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        runXdgAutostartIfNone = true;
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          picom
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
        ];
      };
      xrandrHeads = builtins.map (mon: {
        output = mon.xname;
        primary = mon.primary;
        monitorConfig = ''
          Option "PreferredMode" "${toString mon.width}x${toString mon.height}"
        '';
      }) config.myHardware.monitors;
      exportConfiguration = true;
    };
    programs.dconf.enable = true;
  };
}
