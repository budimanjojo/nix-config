{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.yamllint;
in {
  options.modules.program.yamllint = { enable = mkEnableOption "yamllint"; };

  config = mkIf cfg.enable {
    home.manager = {
      home.packages = [ pkgs.yamllint ];
      xdg.configFile."yamllint/config".source = ./config;
    };

  };
}
