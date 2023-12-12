{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.program.gui-utils;
in {
  options.hm-modules.program.gui-utils = { enable = mkEnableOption "default gui-utils"; };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome.gnome-calculator
      gparted
    ];
  };
}
