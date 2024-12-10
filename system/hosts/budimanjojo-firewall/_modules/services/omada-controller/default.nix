{ config, ... }:
let
  app = "omada-controller";
  dataDir = "/var/lib/omada-controller-data";
  logsDir = "/var/lib/omada-controller-logs";
in
{
  systemd.tmpfiles.rules = [
    "d ${dataDir} 0755 508 508"
    "d ${logsDir} 0755 508 508"
  ];
  virtualisation.oci-containers.containers.omada-controller = {
    image = "docker.io/mbentley/omada-controller:5.15";
    extraOptions = [
      "--ip=10.5.0.10"
      "--stop-timeout=30"
    ];
    volumes = [
      "${dataDir}:/opt/tplink/EAPController/data:rw"
      "${logsDir}:/opt/tplink/EAPController/logs:rw"
    ];
    environment = {
      TZ = "Asia/Jakarta";
    };
  };

  services.restic.backups = config.lib.mySystem.mkRestic {
    inherit app;
    paths = [
      "${dataDir}"
      "${logsDir}"
    ];
    excludePaths = [ "autobackup" ];
  };
}
