{ pkgs, lib, config, ... }:
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
          command = "${pkgs.sway}/bin/swaymsg \"output * dpms off\"";
          resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * dpms on\"";
        }
      ];
      systemdTarget = mkIf config.modules.windowmanager.hyprland.enable "hyprland-session.target";
    };
  };
}
