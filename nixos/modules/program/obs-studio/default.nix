{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.obs-studio;
in {
  options.modules.program.obs-studio = { enable = mkEnableOption "obs-studio"; };

  config = mkIf cfg.enable {
    home.manager.programs.obs-studio = {
      enable = true;
      plugins = mkIf config.deviceCfg.isWayland [ pkgs.obs-studio-plugins.wlrobs ];
    };
  };
}
