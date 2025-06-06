{ ... }:
{
  config = {
    # filesystems managed by Disko are defined here
    disko.devices.disk.main = {
      type = "disk";
      device = "/dev/disk/by-id/ata-BR_128GB_202209231491";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            priority = 1;
            name = "ESP";
            start = "1M";
            end = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ]; # override existing partiion
              subvolumes = {
                "/rootfs" = {
                  mountpoint = "/";
                };
                "/home" = {
                  mountpoint = "/home";
                };
                "/nix" = {
                  mountpoint = "/nix";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
              };
            };
          };
        };
      };
    };

    # filesystems not managed by Disko are defined here
    fileSystems = {
      "/home" = {
        # This is needed for `sops-nix` to work properly on reboot
        # see: https://github.com/Mic92/sops-nix/issues/149
        neededForBoot = true;
      };
    };
  };
}
