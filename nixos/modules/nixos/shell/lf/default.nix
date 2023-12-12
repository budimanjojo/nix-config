{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.shell.lf;
in {
  options.modules.shell.lf = { enable = mkEnableOption "lf"; };

  config = mkIf cfg.enable {
    security.sudo.enable = true;
  };
}
