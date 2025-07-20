{ pkgs, config, ... }:
let
  app = "tdarr";
  serverDir = "/var/lib/tdarr-server";
  configsDir = "/var/lib/tdarr-config";
  logsDir = "/var/lib/tdarr-logs";
  cacheDir = "/var/lib/tdarr-cache";
  tdarr-plugins-start = pkgs.writeShellApplication {
    name = "start";
    runtimeInputs = [ pkgs.git ];
    text = ''
      if [ -z "$STATE_DIRECTORY" ]; then
        echo "STATE_DIRECTORY is not set, exiting..."
        exit 1
      fi

      repoURL="https://github.com/budimanjojo/tdarr-plugins.git"
      if [ ! -d "$STATE_DIRECTORY"/.git ]; then
        echo "cloning repository into $STATE_DIRECTORY..."
        git clone "$repoURL" "$STATE_DIRECTORY"
      else
        echo "repository already exists in $STATE_DIRECTORY"
        originURL=$(git -C "$STATE_DIRECTORY" remote get-url origin)
        if [ "$repoURL" != "$originURL" ]; then
          echo "remote URL mismatch, remove everything and re pull"
          rm -rf "''${STATE_DIRECTORY:?}"/{*,.*}
          git clone "$repoURL" "$STATE_DIRECTORY"
        else
          echo "pulling latest commits..."
          git -C "$STATE_DIRECTORY" pull
        fi
      fi
    '';
  };
in
{
  # this service ensures that /var/lib/tdarr-plugins directory is
  # pre populated with my own Tdarr plugins
  systemd.services.tdarr-plugins-dir = {
    requiredBy = [ "podman-tdarr.service" ];
    before = [ "podman-tdarr.service" ];
    serviceConfig = {
      ExecStart = "${tdarr-plugins-start}/bin/start";
      User = "${config.mySystem.adminUser}";
      StateDirectory = "tdarr-plugins";
    };
  };
  # we mount media directory from the NFS server
  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;
  systemd.mounts = [
    {
      type = "nfs";
      what = "192.168.200.30:/Kubernetes-Volumes/default-shared-media";
      where = "/mnt/media-nfs";
      options = "nfsvers=4.2,nolock,hard,rw,noatime,nconnect=8";
    }
  ];
  systemd.automounts = [
    {
      where = "/mnt/media-nfs";
      requiredBy = [ "podman-tdarr.service" ];
    }
  ];

  # create directories needed for the volumes
  systemd.tmpfiles.rules = [
    "d ${serverDir} 0755 1000 1000"
    "d ${configsDir} 0755 1000 1000"
    "d ${logsDir} 0755 1000 1000"
    "d ${cacheDir} 0755 1000 1000"
  ];

  # the actual Tdarr service in container
  virtualisation.oci-containers.containers.tdarr = {
    image = "ghcr.io/haveagitgat/tdarr:2.45.01";
    extraOptions = [
      "--ip=10.5.0.20"
      # we use our local dns server to connect to Radarr/Sonarr inside my internal k8s gateway
      "--dns=192.168.10.1"
    ];
    volumes = [
      "${serverDir}:/app/server:rw"
      "${configsDir}:/app/configs:rw"
      "${logsDir}:/app/logs:rw"
      "${cacheDir}:/temp:rw"
      "/var/lib/tdarr-plugins:/tdarr-plugins:ro"
      "/mnt/media-nfs:/media:rw"
    ];
    environment = {
      serverIP = "0.0.0.0";
      serverPort = "8266";
      webUIPort = "8265";
      internalNode = "true";
      inContainer = "true";
      maxLogSizeMB = "10";
      pluginsDir = "/tdarr-plugins";
      TZ = "Asia/Jakarta";
      PUID = "1000";
      PGID = "1000";
    };
    devices = [ "/dev/dri:/dev/dri" ];
  };

  # restic backup
  services.restic.backups = config.lib.mySystem.mkRestic {
    inherit app;
    paths = [
      "${serverDir}"
      "${configsDir}"
    ];
  };
}
