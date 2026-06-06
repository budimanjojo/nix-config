{
  flake.modules.nixos.budimanjojo-firewall = {
    mySystem.services.restic-backup = {
      enable = true;
      location = "/mnt/backup-nfs";
    };

    boot.supportedFilesystems = [ "nfs" ];
    services.rpcbind.enable = true;
    systemd = {
      mounts = [
        {
          type = "nfs";
          what = "192.168.200.30:/Backups/restic-budimanjojo-firewall";
          where = "/mnt/backup-nfs";
          options = "nfsvers=4.2,nolock,hard,rw,noatime,nconnect=8";
        }
      ];
      automounts = [
        {
          wantedBy = [ "multi-user.target" ];
          automountConfig.TimeoutIdleSec = "600";
          where = "/mnt/backup-nfs";
        }
      ];
    };
  };
}
