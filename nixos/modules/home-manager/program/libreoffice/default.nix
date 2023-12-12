{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.program.libreoffice;
in {
  options.hm-modules.program.libreoffice = { enable = mkEnableOption "libreoffice"; };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-fresh
    ];
  };
}
