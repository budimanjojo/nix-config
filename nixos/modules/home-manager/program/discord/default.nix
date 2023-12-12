{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.program.discord;
in {
  options.hm-modules.program.discord = { enable = mkEnableOption "discord"; };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.discord ];
  };
}
