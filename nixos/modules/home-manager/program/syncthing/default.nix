{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.program.syncthing;
in {
  options.hm-modules.program.syncthing = { enable = mkEnableOption "syncthing"; };

  config = mkIf cfg.enable {
    sops = {
      secrets = {
        "syncthingtray.ini" = {
          sopsFile = ./secret.sops.yaml;
          path = "${config.home.homeDirectory}/.config/syncthingtray.ini";
          mode = "700";
        };
      };
    };

    services.syncthing = {
      enable = true;
      tray.enable = true;
    };

    systemd.user.services.syncthingtray.Service.ExecStart = mkForce "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray'";
  };
}
