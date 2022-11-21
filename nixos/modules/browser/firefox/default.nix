{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.browser.firefox;
  device = config.modules.device;
  firefoxAddons = config.nur.repos.rycee.firefox-addons;
  extensionsList = with firefoxAddons; [
    bitwarden
    tridactyl
    tokyo-night-v2
  ];
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
        /* To use the extensions on your profile, launch Firefox Profile Manager
        and create a New Profile, then choose the directory named as your
        Firefox profile (your username by default). This is due to a behavior
        of Firefox that prevent Home Manager to manage profiles for you. */
        extensions = extensionsList;
      };
      
      # Manually manage Firefox profiles until https://github.com/nix-community/home-manager/issues/3117 is fixed
      home.file = let
        extensionsEnvPkg = pkgs.buildEnv {
          name = "hm-firefox-extensions";
          paths = extensionsList;
        };
        extensionPath = "extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}";
      in
      listToAttrs (forEach device.firefoxProfiles (profile:
        nameValuePair ".mozilla/firefox/${profile}/extensions" {
          source = "${extensionsEnvPkg}/share/mozilla/${extensionPath}";
          recursive = true;
          force = true;
        }
      ));

      xdg.configFile."tridactyl".source = ./tridactyl;
    };
  };
}
