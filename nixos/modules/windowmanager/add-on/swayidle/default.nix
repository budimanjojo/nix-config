{ pkgs, lib, config, inputs, system, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.swayidle;
in {
  options.modules.windowmanager.add-on.swayidle = {
    enable = mkEnableOption "swayidle";
  };

  config = mkIf cfg.enable {
    home.manager.services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 1800;
          command = (mkMerge [
            (mkIf config.modules.windowmanager.sway.enable "${pkgs.sway}/bin/swaymsg \"output * dpms off\"")
            (mkIf config.modules.windowmanager.hyprland.enable "${inputs.hyprland.packages.${system}.hyprland}/bin/hyprctl dispatch dpms off")
          ]);
          resumeCommand = (mkMerge [
            (mkIf config.modules.windowmanager.sway.enable "${pkgs.sway}/bin/swaymsg \"output * dpms on\"")
            (mkIf config.modules.windowmanager.hyprland.enable "${inputs.hyprland.packages.${system}.hyprland}/bin/hyprctl dispatch dpms on")
          ]);
        }
      ];
      systemdTarget = mkIf config.modules.windowmanager.hyprland.enable "hyprland-session.target";
    };
  };
}
