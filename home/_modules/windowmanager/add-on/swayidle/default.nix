{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.windowmanager.add-on.swayidle;
  wmCfg = config.wayland.windowManager;
in
with lib;
{
  options.myHome.windowmanager.add-on.swayidle = {
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
      systemdTarget = mkIf wmCfg.hyprland.enable "hyprland-session.target";
    };
  };
}
