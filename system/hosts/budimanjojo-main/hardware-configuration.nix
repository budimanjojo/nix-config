{ modulesPath, lib, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  config = {
    boot = {
      initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
    };
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/d1d4bccb-7efb-4af3-b0c8-6b3cf162604f";
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
        device = "/dev/disk/by-uuid/d1d4bccb-7efb-4af3-b0c8-6b3cf162604f";
        fsType = "btrfs";
        options = [ "subvol=nix" ];
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/294B-A128";
        fsType = "vfat";
      };
    };
    swapDevices = [ ];
    networking.useDHCP = lib.mkDefault true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
