{
  flake.modules.nixos.core =
    { lib, hardware, ... }:
    {
      config = lib.mkMerge [
        (lib.mkIf (hardware.cpu == "amd") {
          hardware.cpu.amd.updateMicrocode = true;
          boot.kernelModules = [ "kvm-amd" ];
        })
        (lib.mkIf (hardware.cpu == "intel") {
          hardware.cpu.intel.updateMicrocode = true;
          boot.kernelModules = [ "kvm-intel" ];
        })
      ];
    };
}
