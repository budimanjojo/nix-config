{ lib, config, ... }:
with lib;
let 
  deviceCfg = config.deviceCfg;
in {
  config = mkMerge [
    (mkIf (deviceCfg.cpu == "amd") {
      hardware.cpu.amd.updateMicrocode = true;
      boot.kernelModules = [ "kvm-amd" ];
    })
    (mkIf (deviceCfg.cpu == "intel") {
      hardware.cpu.intel.updateMicrocode = true;
      boot.kernelModules = [ "kvm-intel" ];
    })
    (mkIf (deviceCfg.cpu == "vm") {
      hardware.cpu.amd.updateMicrocode = true;
      boot.kernelModules = [ "kvm-amd" ];
    })
  ];
}
