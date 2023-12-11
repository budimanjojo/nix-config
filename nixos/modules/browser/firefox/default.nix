{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.browser.firefox;
  deviceCfg = config.deviceCfg;
in {
  options.modules.browser.firefox = { enable = mkEnableOption "firefox"; };

  config = mkIf cfg.enable {
    home.manager = {
      programs.firefox = {
        enable = true;
        profiles = deviceCfg.firefoxProfiles;
      };
    };
  };
}
