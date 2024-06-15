{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.hm-modules.program.hugo;
in
{
  options.hm-modules.program.hugo = {
    enable = mkEnableOption "hugo";
  };

  config = mkIf cfg.enable { home.packages = with pkgs; [ hugo ]; };
}
