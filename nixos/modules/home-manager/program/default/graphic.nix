{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.program.graphic;
in {
  options.hm-modules.program.graphic = { enable = mkEnableOption "default graphic"; };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gimp
      inkscape
    ];
  };
}
