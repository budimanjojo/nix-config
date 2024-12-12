{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.mySystem.system.video;
  myHardware = config.myHardware;
  mySystem = config.mySystem;
  inherit (lib) mkEnableOption mkIf mkMerge;
in
{
  options.mySystem.system.video = {
    enable = mkEnableOption "video";
  };

  config = mkIf (cfg.enable) (mkMerge [
    {
      hardware = {
        graphics = {
          enable = true;
          enable32Bit = true;
        };
      };
      users.users.${mySystem.adminUser}.extraGroups = [ "video" ];
    }

    (mkIf (myHardware.gpuDriver == "nouveau") {
      # enable the nouveau kernel module
      boot.initrd.kernelModules = [ "nouveau" ];
      services.xserver.videoDrivers = [ "nouveau" ];
      environment.variables = {
        VDPAU_DRIVER = "nouveau";
        LIBVA_DRIVER_NAME = "nouveau";
      };
    })

    (mkIf (myHardware.gpuDriver == "nvidia") {
      # enable nvidia kernel module
      boot.initrd.kernelModules = [ "nvidia" ];
      boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
      services.xserver.videoDrivers = [ "nvidia" ];
      # hardware acceleration
      hardware.graphics.extraPackages = [
        pkgs.vaapiVdpau
        pkgs.libvdpau-va-gl
      ];
      hardware.nvidia = {
        open = false;
        modesetting.enable = true;
        # enable Nvidia settings menu
        nvidiaSettings = true;
      };
      environment.variables = {
        VDPAU_DRIVER = "va_gl";
        LIBVA_DRIVER_NAME = "nvidia";
      };
    })

    (mkIf (myHardware.gpuDriver == "amd") {
      # enable amdgpu kernel module
      boot.initrd.kernelModules = [ "amdgpu" ];
      services.xserver.videoDrivers = [ "amdgpu" ];
      # enables AMDVLK & OpenCL support
      hardware.graphics.extraPackages = with pkgs; [
        amdvlk
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
      hardware.graphics.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
      # force use of RADV, can be unset if AMDVLK should be used
      environment.variables.AMD_VULKAN_ICD = "RADV";
    })

    (mkIf (myHardware.gpuDriver == "intel") {
      # enable the i915 kernel module
      boot.initrd.kernelModules = [ "i915" ];
      # better performance than the actual Intel driver
      services.xserver.videoDrivers = [ "modesetting" ];
      # OpenCL support and VAAPI
      hardware.graphics.extraPackages = [
        pkgs.intel-compute-runtime
        pkgs.intel-media-driver
        pkgs.vaapiIntel
        pkgs.vaapiVdpau
        pkgs.libvdpau-va-gl
      ];
      environment.variables.VDPAU_DRIVER = "va_gl";
    })
  ]);
}
