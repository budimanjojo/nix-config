{ lib, config, ... }:
with lib;
let
  cfg = config.modules.program.beeaccounting;
in {
  options.modules.program.beeaccounting = { enable = mkEnableOption "beeaccounting"; };

  config = mkIf cfg.enable {
    users.users.${config.deviceCfg.username}.extraGroups = [ "docker" ];
    virtualisation = {
      docker.enable = true;
      oci-containers = {
        ## because https://github.com/NixOS/nixpkgs/issues/259770
        backend = "docker";
        containers.beeaccounting = {
          image = "ghcr.io/budimanjojo/beeaccounting/beeplat-server:v1.0.0";
          autoStart = true;
          login = {
            username = "budimanjojo";
            registry = "ghcr.io";
            passwordFile = config.sops.secrets.budimanjojo-ghcr-pull-token.path;
          };
          extraOptions = [
            "--device=/dev/bus/usb"
            "--ulimit"
            "nofile=1024:524288"
          ];
          ports = [
            "5432:5432"
            "631:631"
            "5353:5353/udp"
          ];
          volumes = [
            "/tmp/.X11-unix:/tmp/.X11-unix"
            "beeaccounting-app:/app"
            "beeaccounting-db:/var/lib/postgresql"
            "beeaccounting-cups:/etc/cups"
            "/home/${config.deviceCfg.username}/Nextcloud:/nextcloud"
          ];
          environment = {
            ## There's no good way to get $DISPLAY from the host and it's unpure
            DISPLAY = ":0";
            TZ = "Asia/Jakarta";
            _JAVA_AWT_WM_NONREPARENTING = "1";
            PUID = "${toString config.deviceCfg.uid}";
          };
        };
      };
    };
  };
}
