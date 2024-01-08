{ lib, config,... }:
with lib;
let
  cfg = config.hm-modules.program.go;
in {
  options.hm-modules.program.go = { enable = mkEnableOption "go"; };

  config = mkIf cfg.enable {
    programs.go.enable = true;
  };
}
