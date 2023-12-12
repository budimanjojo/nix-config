{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.program.yamllint;
in {
  options.hm-modules.program.yamllint = { enable = mkEnableOption "yamllint"; };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.yamllint ];
    xdg.configFile."yamllint/config".source = ./config;
  };
}
