{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.syncthing;
in {
  options.modules.program.syncthing = { enable = mkEnableOption "syncthing"; };

  config = mkIf cfg.enable {
    sops = {
      secrets = {
        "syncthingtray.ini" = {
          sopsFile = ./secret.sops.yaml;
          path = "${config.home.manager.home.homeDirectory}/.config/syncthingtray.ini";
          mode = "700";
          owner = "${config.deviceCfg.username}";
          group = "users";
        };
      };
    };

    home.manager.services.syncthing = {
      enable = true;
      tray.enable = true;
    };

    home.manager.systemd.user.services.syncthingtray.Service.ExecStart = mkForce "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray'";
  };
}
