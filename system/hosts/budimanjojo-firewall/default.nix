{ ... }:
{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ./_modules # host specific modules
    ../../profiles/server.nix
  ];

  config = {
    myHardware.cpu = "intel";

    mySystem = {
      programs.nh = {
        enable = true;
        flake = "/home/budiman/Github/nix-config";
      };
      services = {
        btrfs-autoscrub = {
          enable = true;
          fileSystems = [ "/" ];
        };
        restic-backup = {
          enable = true;
          location = "/mnt/backup-nfs";
        };
      };
    };

    boot.supportedFilesystems = [ "nfs" ];
    services.rpcbind.enable = true;
    systemd.mounts = [
      {
        type = "nfs";
        what = "192.168.200.30:/Backups/restic-budimanjojo-firewall";
        where = "/mnt/backups-nfs";
        options = "nfsvers=4.2,nolock,hard,rw,noatime,nconnect=8";
      }
    ];
    systemd.automounts = [
      {
        wantedBy = [ "multi-user.target" ];
        automountConfig.TimeoutIdleSec = "600";
        where = "/mnt/backups-nfs";
      }
    ];

    services.openssh.listenAddresses = [
      { addr = "192.168.200.1"; }
      { addr = "192.168.50.1"; }
    ];

    # sshd failed to start on boot when interface is not ready yet
    systemd.services.sshd = {
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
    };
  };
}
