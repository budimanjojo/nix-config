{ ... }:
{
  config = {
    # filesystems managed by Disko are defined here
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "/dev/disk/by-id/ata-KINGSTON_SA400S37120G_50026T0910A0397";
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

        # full btrfs drive for incus
        vm-data = {
          type = "disk";
          device = "/dev/disk/by-id/ata-Kingmax_SSD_240GB_1393070A113C00097082";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ]; # override existing partition
            mountpoint = "/vm-data";
          };
        };
      };
    };

    # NAS data not managed by Disko
    fileSystems = {
      "/nas-data" = {
        device = "/dev/disk/by-label/BTRFS-RAID10";
        fsType = "btrfs";
      };
    };
  };
}
