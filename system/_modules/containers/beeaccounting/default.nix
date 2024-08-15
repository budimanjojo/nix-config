{ lib, config, ... }:
with lib;
let
  mySystem = config.mySystem;
  cfg = mySystem.containers.beeaccounting;
  ghcr-login = {
    username = "budimanjojo";
    registry = "ghcr.io";
    passwordFile = config.sops.secrets.budimanjojo-ghcr-pull-token.path;
  };
  userCfg = config.users.users.${mySystem.adminUser};
in
{
  options.mySystem.containers.beeaccounting = {
    enable = mkEnableOption "Beeaccounting";
  };

  config = mkIf cfg.enable {
    sops.secrets.budimanjojo-ghcr-pull-token.sopsFile = ./secret.sops.yaml;

    networking.firewall.allowedTCPPorts = [
      5432
      631
      5353
    ];

    users.users.${mySystem.adminUser}.extraGroups = [ "docker" ];

    virtualisation = {
      oci-containers = {
        ## because https://github.com/NixOS/nixpkgs/issues/259770
        backend = "docker";
        containers = {
          beeaccounting-db = {
            image = "ghcr.io/budimanjojo/beeaccounting/beeplat-database:v1.1.1";
            autoStart = true;
            login = ghcr-login;
            ports = [ "5432:5432" ];
            volumes = [ "beeaccounting-db:/data" ];
          };
          beeaccounting-app = {
            image = "ghcr.io/budimanjojo/beeaccounting/beeplat-client:v1.1.1";
            autoStart = true;
            login = ghcr-login;
            extraOptions = [
              "--device=/dev/bus/usb"
              "--ulimit"
              "nofile=1024:524288"
            ];
            ports = [
              "631:631"
              "5353:5353/udp"
            ];
            volumes = [
              "/tmp/.X11-unix:/tmp/.X11-unix"
              "beeaccounting-app:/app"
              "beeaccounting-cups:/etc/cups"
              "/home/${mySystem.adminUser}/Nextcloud:/nextcloud"
            ];
            environment = {
              ## There's no good way to get $DISPLAY from the host and it's unpure
              DISPLAY = ":0";
              TZ = "Asia/Jakarta";
              _JAVA_AWT_WM_NONREPARENTING = "1";
              PUID = "${toString userCfg.uid}";
              PGID = "${toString config.users.groups.${userCfg.group}.gid}";
              TYPE = "server";
            };
          };
        };
      };
    };
  };
}
