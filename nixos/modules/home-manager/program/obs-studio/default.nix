{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.hm-modules.program.obs-studio;
in
{
  options.hm-modules.program.obs-studio = {
    enable = mkEnableOption "obs-studio";
  };

  config = mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      plugins = mkIf config.deviceCfg.isWayland [ pkgs.obs-studio-plugins.wlrobs ];
    };
  };
}
