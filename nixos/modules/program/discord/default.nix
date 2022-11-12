{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.discord;
in {
  options.modules.program.discord = { enable = mkEnableOption "discord"; };

  config = mkIf cfg.enable {
    home.manager.home.packages = [ pkgs.discord ];
  };
}
