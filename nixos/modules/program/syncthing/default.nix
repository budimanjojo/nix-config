{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.syncthing;
in {
  options.modules.program.syncthing = { enable = mkEnableOption "syncthing"; };

  config = mkIf cfg.enable {
    age = {
      identityPaths = [ "${config.home.manager.home.homeDirectory}/.config/sops/age/keys.txt" ];
      secrets = {
        syncthingtray = {
          file = ./syncthingtray.ini.age;
          path = "${config.home.manager.home.homeDirectory}/.config/syncthingtray.ini";
          mode = "700";
          owner = "${config.modules.device.username}";
          group = "users";
        };
      };
    };
    home.manager.services.syncthing = {
      enable = true;
      tray.enable = true;
    };
  };
}
