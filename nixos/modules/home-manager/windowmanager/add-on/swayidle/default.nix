{ pkgs, lib, config, inputs, system, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.swayidle;
in {
  options.hm-modules.windowmanager.add-on.swayidle = {
    enable = mkEnableOption "swayidle";
  };

  config = mkIf cfg.enable {
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 1800;
          command = (mkMerge [
            (mkIf config.hm-modules.windowmanager.sway.enable "${pkgs.sway}/bin/swaymsg \"output * dpms off\"")
            (mkIf config.hm-modules.windowmanager.hyprland.enable "${inputs.hyprland.packages.${system}.hyprland}/bin/hyprctl dispatch dpms off")
          ]);
          resumeCommand = (mkMerge [
            (mkIf config.hm-modules.windowmanager.sway.enable "${pkgs.sway}/bin/swaymsg \"output * dpms on\"")
            (mkIf config.hm-modules.windowmanager.hyprland.enable "${inputs.hyprland.packages.${system}.hyprland}/bin/hyprctl dispatch dpms on")
          ]);
        }
      ];
      systemdTarget = mkIf config.hm-modules.windowmanager.hyprland.enable "hyprland-session.target";
    };
  };
}
