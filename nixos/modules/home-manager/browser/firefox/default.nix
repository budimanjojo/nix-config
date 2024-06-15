{ lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.browser.firefox;
  deviceCfg = config.deviceCfg;
in
{
  options.hm-modules.browser.firefox = {
    enable = mkEnableOption "firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles = deviceCfg.firefoxProfiles;
    };
  };
}
