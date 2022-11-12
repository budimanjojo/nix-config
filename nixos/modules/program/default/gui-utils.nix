{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.gui-utils;
in {
  options.modules.program.gui-utils = { enable = mkEnableOption "default gui-utils"; };

  config = mkIf cfg.enable {
    home.manager.home.packages = with pkgs; [
      gnome.gnome-calculator
      gparted
    ];
  };
}
