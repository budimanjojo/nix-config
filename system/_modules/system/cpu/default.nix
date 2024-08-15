{ config, lib, ... }:
let
  myHardware = config.myHardware;
in
{
  config = lib.mkMerge [
    (lib.mkIf (myHardware.cpu == "amd") {
      hardware.cpu.amd.updateMicrocode = true;
      boot.kernelModules = [ "kvm-amd" ];
    })
    (lib.mkIf (myHardware.cpu == "intel") {
      hardware.cpu.intel.updateMicrocode = true;
      boot.kernelModules = [ "kvm-intel" ];
    })
  ];
}
