{
  config,
  pkgs,
  lib,
  options,
  ...
}:
let
  mySystem = config.mySystem;
  myHardware = config.myHardware;
  cfg = mySystem.displaymanager.sddm;

  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    concatMapStrings
    ;
in
{
  options.mySystem.displaymanager.sddm = {
    enable = mkEnableOption "SDDM display manager";
    wallpaper = mkOption {
      type = types.nullOr types.path;
      default = null;
    };
    defaultSession = mkOption {
      type = options.services.displayManager.defaultSession.type;
      default = options.services.displayManager.defaultSession.default;
    };
  };

  config = mkIf (cfg.enable) {
    services = {
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = mySystem.isWayland;
          catppuccin = {
            enable = true;
            background = cfg.wallpaper;
            loginBackground = true;
          };
          package = pkgs.kdePackages.sddm;
        };
        defaultSession = cfg.defaultSession;
      };

      # turn off non primary monitors on X11 because sddm weirdly displays prompt on all screens
      xserver.displayManager.setupCommands = mkIf (!mySystem.isWayland) (
        "${pkgs.xorg.xrandr}/bin/xrandr"
        + (concatMapStrings (
          mon:
          " --output ${mon.xname}"
          + (
            if (mon.primary) then
              " --pos ${toString mon.x}x${toString mon.y} --mode ${toString mon.width}x${toString mon.height}"
            else
              " --off"
          )
        ) myHardware.monitors)
      );
    };
  };
}
