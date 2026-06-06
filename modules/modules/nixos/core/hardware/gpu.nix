{
  flake.modules.nixos.core =
    {
      lib,
      hardware,
      primaryUser,
      config,
      pkgs,
      ...
    }:
    {
      config = lib.mkMerge [
        (lib.mkIf (hardware.gpuDriver != null) {
          hardware.graphics = {
            enable = true;
            enable32Bit = true;
          };
          users.users.${primaryUser}.extraGroups = [ "video" ];
        })

        (lib.mkIf (hardware.gpuDriver == "nouveau") {
          # enable nouveau kernel module
          boot.initrd.kernelModules = [ "nouveau" ];
          services.xserver.videoDrivers = [ "nouveau" ];
          environment.variables = {
            VDPAU_DRIVER = "nouveau";
            LIBVA_DRIVER_NAME = "nouveau";
          };
        })

        (lib.mkIf (hardware.gpuDriver == "nvidia") {
          # enable nvidia kernel module
          boot.initrd.kernelModules = [ "nvidia" ];
          boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
          services.xserver.videoDrivers = [ "nvidia" ];
          # hardware acceleration
          hardware.graphics.extraPackages = [
            pkgs.libva-vdpau-driver
            pkgs.libvdpau-va-gl
          ];
          hardware.nvidia = {
            open = false;
            modesetting.enable = true;
            # enable nvidia settings menu
            nvidiaSettings = true;
          };
          environment.variables = {
            VDPAU_DRIVER = "va_gl";
            LIBVA_DRIVER_NAME = "nvidia";
          };
        })

        (lib.mkIf (hardware.gpuDriver == "amd") {
          # enable amdgpu kernel module
          boot.initrd.kernelModules = [ "amdgpu" ];
          services.xserver.videoDrivers = [ "amdgpu" ];
          # enable AMDVLK & OpenCL support
          hardware.graphics.extraPackages = with pkgs; [
            amdvlk
            rocm-opencl-icd
            rocm-opencl-runtime
          ];
          hardware.graphics.extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
          # force use of RADV, can be unset if AMDVLK should be used
          environment.variables.AMD_VULKAN_ICD = "RADV";
        })

        (lib.mkIf (hardware.gpuDriver == "intel") {
          # enable i915 kernel module
          boot.initrd.kernelModules = [ "i915" ];
          # better performance than the actual Intel driver
          services.xserver.videoDrivers = [ "modesetting" ];
          # OpenCL support and VAAPI
          hardware.graphics.extraPackages = with pkgs; [
            intel-compute-runtime
            intel-media-driver
            vaapiIntel
            vaapiVdpau
            libvdpau-va-gl
          ];
          environment.variables.VDPAU_DRIVER = "va_gl";
        })
      ];
    };
}
