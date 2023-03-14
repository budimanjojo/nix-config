{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.libreoffice;
in {
  options.modules.program.libreoffice = { enable = mkEnableOption "libreoffice"; };

  config = mkIf cfg.enable {
    home.manager = {
      home.packages = with pkgs; [
        libreoffice-fresh
      ];
    };
  };
}
