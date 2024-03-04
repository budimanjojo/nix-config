{ pkgs, lib, config, ... }:
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
            (mkIf config.hm-modules.windowmanager.hyprland.enable "${config.wayland.windowManager.hyprland.finalPackage}/bin/hyprctl dispatch dpms off")
          ]);
          resumeCommand = (mkMerge [
            (mkIf config.hm-modules.windowmanager.sway.enable "${pkgs.sway}/bin/swaymsg \"output * dpms on\"")
            (mkIf config.hm-modules.windowmanager.hyprland.enable "${config.wayland.windowManager.hyprland.finalPackage}/bin/hyprctl dispatch dpms on")
          ]);
        }
      ];
      systemdTarget = mkIf config.hm-modules.windowmanager.hyprland.enable "hyprland-session.target";
    };
  };
}
