{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.system.video;
  deviceCfg = config.deviceCfg;
in
{
  options.modules.system.video = {
    enable = mkEnableOption "video";
  };

  config = mkIf (cfg.enable) (mkMerge [
    {
      hardware = {
        opengl = {
          enable = true;
          driSupport = true;
          driSupport32Bit = true;
        };
      };
      users.users.${deviceCfg.username}.extraGroups = [ "video" ];
    }
    (mkIf (deviceCfg.gpu == "nvidia") {
      # enable nvidia kernel module
      boot.initrd.kernelModules = [ "nvidia" ];
      boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
      services.xserver.videoDrivers = [ "nvidia" ];
      # hardware acceleration
      hardware.opengl.extraPackages = [
        pkgs.vaapiVdpau
        pkgs.libvdpau-va-gl
      ];
      hardware.nvidia = {
        modesetting.enable = true;
        # enable Nvidia settings menu
        nvidiaSettings = true;
      };
      environment.variables = {
        VDPAU_DRIVER = "va_gl";
        LIBVA_DRIVER_NAME = "nvidia";
      };
    })

    (mkIf (deviceCfg.gpu == "amd") {
      # enable amdgpu kernel module
      boot.initrd.kernelModules = [ "amdgpu" ];
      services.xserver.videoDrivers = [ "amdgpu" ];
      # enables AMDVLK & OpenCL support
      hardware.opengl.extraPackages = with pkgs; [
        amdvlk
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
      hardware.opengl.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
      # force use of RADV, can be unset if AMDVLK should be used
      environment.variables.AMD_VULKAN_ICD = "RADV";
    })

    (mkIf (deviceCfg.gpu == "intel") {
      # enable the i915 kernel module
      boot.initrd.kernelModules = [ "i915" ];
      # better performance than the actual Intel driver
      services.xserver.videoDrivers = [ "modesetting" ];
      # OpenCL support and VAAPI
      hardware.opengl.extraPackages = [
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
