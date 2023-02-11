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
        package = pkgs.firefox.override {
          cfg = {
            enableTridactylNative = true;
          };
        };
        profiles = device.firefoxProfiles;
      };

      xdg.configFile."tridactyl".source = ./tridactyl;
    };
  };
}
