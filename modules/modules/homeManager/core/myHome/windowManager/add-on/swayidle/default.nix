{
  flake.modules.homeManager.core =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.myHome.windowManager.add-on.swayidle;
      wmCfg = config.wayland.windowManager;
    in
    with lib;
    {
      options.myHome.windowManager.add-on.swayidle = {
        enable = mkEnableOption "Swayidle";
      };

      config = mkIf (cfg.enable) {
        services.swayidle = {
          enable = true;
          timeouts = [
            {
              timeout = 1800;
              command = (
                mkMerge [
                  (mkIf wmCfg.sway.enable "${pkgs.sway}/bin/swaymsg \"output * dpms off\"")
                  (mkIf wmCfg.hyprland.enable "${wmCfg.hyprland.finalPackage}/bin/hyprctl dispatch dpms off")
                ]
              );
              resumeCommand = (
                mkMerge [
                  (mkIf wmCfg.sway.enable "${pkgs.sway}/bin/swaymsg \"output * dpms on\"")
                  (mkIf wmCfg.hyprland.enable "${wmCfg.hyprland.finalPackage}/bin/hyprctl dispatch dpms on")
                ]
              );
            }
          ];
        };
      };
    };
}
