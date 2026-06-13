{
  flake.modules.nixos.budimanjojo-main =
    { modulesPath, lib, ... }:
    {
      imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];

      fileSystems = {
        "/" = {
          device = "/dev/disk/by-uuid/0350e758-e88b-4dcd-aa79-08fd960a4d12";
          fsType = "btrfs";
          options = [ "subvol=root" ];
        };
        "/home" = {
          device = "/dev/disk/by-uuid/e5dd078f-db8a-4652-8931-6c2e8c8c2ed6";
          fsType = "btrfs";
          options = [ "subvol=home" ];
          neededForBoot = true;
        };
        "/nix" = {
          device = "/dev/disk/by-uuid/0350e758-e88b-4dcd-aa79-08fd960a4d12";
          fsType = "btrfs";
          options = [ "subvol=nix" ];
        };
        "/boot" = {
          device = "/dev/disk/by-uuid/3695-A7A1";
          fsType = "vfat";
        };
      };

      swapDevices = [
        {
          device = "/var/lib/swapfile";
          size = 16 * 1024;
        }
      ];

      networking.useDHCP = lib.mkDefault true;
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };
}
