{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.programs.obs-studio;
in
{
  options.myHome.programs.obs-studio = {
    enable = lib.mkEnableOption "OBS Studio";
  };

  config = lib.mkIf (cfg.enable) {
    programs.obs-studio = {
      enable = true;
      plugins = lib.mkIf config.myHome.isWayland [ pkgs.obs-studio-plugins.wlrobs ];
    };
  };
}
