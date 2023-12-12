{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.program.tui-utils;
in {
  options.modules.program.tui-utils = { enable = mkEnableOption "default tui-utils"; };

  config = mkIf cfg.enable {
    nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 4 --keep-since 7d";
      };
    };
  };
}
