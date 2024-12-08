{ modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "mpt3sas"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ "dm-snapshot" ];
    };
  };
}
