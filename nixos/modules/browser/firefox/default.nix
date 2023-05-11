{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.browser.firefox;
  device = config.modules.device;
in {
  options.modules.browser.firefox = { enable = mkEnableOption "firefox"; };

  config = mkIf cfg.enable {
    home.manager = {
      programs.firefox = {
        enable = true;
        profiles = device.firefoxProfiles;
      };
    };
  };
}
