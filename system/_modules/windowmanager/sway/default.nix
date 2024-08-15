{
  pkgs,
  lib,
  config,
  myPkgs,
  ...
}:
let
  cfg = config.mySystem.windowmanager.sway;
  myHardware = config.myHardware;
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    ;
in
{
  options.mySystem.windowmanager.sway = {
    enable = mkEnableOption "Sway window manager";
    isDefaultSession = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf (cfg.enable) {
    mySystem = {
      isWayland = true;

      windowmanager.add-on = {
        blueman.enable = true;
        gnome-keyring.enable = true;
        networkmanager.enable = true;
        polkit-gnome.enable = true;
        thunar.enable = true;
      };

      system = {
        font.enable = true;
        sound.enable = true;
        video.enable = true;
      };
      displaymanager.sddm = {
        enable = true;
        defaultSession = mkIf (cfg.isDefaultSession) "sway";
      };
    };

    environment.systemPackages = with pkgs; [
      at-spi2-core
      libappindicator-gtk3
      libappindicator-gtk2
      libappindicator
      wl-clipboard
      xdg-utils
      myPkgs.configure-gtk
    ];

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraOptions = mkIf (myHardware.gpuDriver == "nvidia") [ "--unsupported-gpu" ];
      extraSessionCommands = mkIf (myHardware.gpuDriver == "nvidia") ''
        export LIBVA_DRIVER_NAME=nvidia
        export XDG_SESSION_TYPE=wayland
        export GBM_BACKEND=nvidia-drm
        export __GLX_VENDOR_LIBRARY_NAME=nvidia
        export WLR_NO_HARDWARE_CURSORS=1
      '';
    };

    services.dbus.enable = true;
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    networking.networkmanager.enable = true;
    programs.dconf.enable = true;
    programs.xwayland.enable = true;
  };
}
