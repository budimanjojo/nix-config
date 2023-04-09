{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.graphic;
in {
  options.modules.program.graphic = { enable = mkEnableOption "default graphic"; };

  config = mkIf cfg.enable {
    home.manager.home.packages = with pkgs; [
      gimp
      inkscape
    ];
  };
}
