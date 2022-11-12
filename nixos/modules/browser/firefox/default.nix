{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.browser.firefox;
  firefoxAddons = config.nur.repos.rycee.firefox-addons;
in {
  options.modules.browser.firefox = { enable = mkEnableOption "firefox"; };

  config = mkIf cfg.enable {
    home.manager = {
      programs.firefox = {
        enable = true;
        package = pkgs.firefox.override {
          forceWayland = config.modules.device.isWayland;
          cfg = {
            enableTridactylNative = true;
          };
        };
        extensions = with firefoxAddons; [
          bitwarden
          tridactyl
          tokyo-night-v2
        ];
        profiles = {
          budiman = { id = 0; name = "budiman"; };
          lina = { id = 1; name = "lina"; };
        };
      };
      
      xdg.configFile."tridactyl".source = ./tridactyl;
    };
  };
}
