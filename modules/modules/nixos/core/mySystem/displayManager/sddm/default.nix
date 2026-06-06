{
  flake.modules.nixos.core =
    {
      config,
      lib,
      options,
      pkgs,
      hardware,
      ...
    }:
    let
      cfg = config.mySystem.displayManager.sddm;
      inherit (lib)
        mkEnableOption
        mkOption
        types
        mkIf
        concatMapStrings
        ;
    in
    {
      options.mySystem.displayManager.sddm = {
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
        catppuccin.sddm = {
          enable = true;
          background = cfg.wallpaper;
          loginBackground = true;
        };

        services = {
          displayManager = {
            sddm = {
              enable = true;
              wayland.enable = config.mySystem.isWayland;
              package = pkgs.kdePackages.sddm;
            };
            defaultSession = cfg.defaultSession;
          };

          # turn off non primary monitors on X11 because sddm weirdly displays prompt on all screens
          xserver.displayManager.setupCommands = mkIf (!config.mySystem.isWayland) (
            "${pkgs.xorg.xrandr}/bin/xrandr"
            + (concatMapStrings (
              mon:
              "--output ${mon.xname}"
              + (
                if (mon.primary) then
                  "--pos ${toString mon.x}x${toString mon.y} --mode ${toString mon.width}x${toString mon.height}"
                else
                  "--off"
              )
            ) hardware.monitors)
          );
        };
      };
    };
}
