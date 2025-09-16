{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.programs.go;
in
{
  options.myHome.programs.go.enable = lib.mkEnableOption "Go";

  config = lib.mkIf (cfg.enable) {
    programs.go = {
      enable = true;
      package = pkgs.unstable.go;
    };
  };
}
