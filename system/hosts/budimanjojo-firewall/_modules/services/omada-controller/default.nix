{ ... }:
{
  systemd.tmpfiles.rules = [
    "d /var/lib/omada-controller-data 0755 508 508"
    "d /var/lib/omada-controller-logs 0755 508 508"
  ];
  virtualisation.oci-containers.containers.omada-controller = {
    image = "docker.io/mbentley/omada-controller:5.14";
    extraOptions = [
      "--ip=10.5.0.10"
      "--stop-timeout=30"
    ];
    volumes = [
      "/var/lib/omada-controller-data:/opt/tplink/EAPController/data:rw"
      "/var/lib/omada-controller-logs:/opt/tplink/EAPController/logs:rw"
    ];
    environment = {
      TZ = "Asia/Jakarta";
    };
  };
}
