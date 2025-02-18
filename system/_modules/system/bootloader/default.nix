{
  config,
  lib,
  pkgs,
  ...
}:
let
  myHardware = config.myHardware;
in
{
  config = lib.mkMerge [
    {
      boot = {
        initrd.verbose = false;
        consoleLogLevel = 0;
        kernelParams = [
          "quiet"
          "rd.udev.log_level=3"
        ];
        loader.timeout = 1;
      };
    }

    (lib.mkIf (myHardware.isUEFI) {
      boot.loader = {
        systemd-boot = {
          enable = true;
          # memtest86 is not available in aarch64-linux
          memtest86.enable = lib.mkIf (pkgs.system != "aarch64-linux") true;
          configurationLimit = 10;
        };
        efi.canTouchEfiVariables = true;
      };
    })

    (lib.mkIf (!myHardware.isUEFI) {
      boot.loader = {
        grub = {
          enable = true;
          memtest86.enable = true;
          configurationLimit = 10;
        };
      };
    })
  ];
}
