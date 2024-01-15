{ pkgs, lib, config, myPkgs, ... }:
with lib;
let 
  cfg = config.modules.windowmanager.sway;
  deviceCfg = config.deviceCfg;
  greetdSwayNvidia = pkgs.writeShellScript "greetd-sway-nvidia.sh"
    ''
      export LIBVA_DRIVER_NAME=nvidia
      export XDG_SESSION_TYPE=wayland
      export GBM_BACKEND=nvidia-drm
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export WLR_NO_HARDWARE_CURSORS=1
      ${pkgs.sway}/bin/sway --unsupported-gpu
    '';
in {
  options.modules.windowmanager.sway = { enable = mkEnableOption "sway"; };

  config = mkIf cfg.enable {
    deviceCfg.isWayland = true;

    modules.windowmanager.add-on.blueman-applet.enable = true;
    modules.windowmanager.add-on.gnome-keyring.enable = true;
    modules.windowmanager.add-on.polkit-gnome.enable = true;
    modules.windowmanager.add-on.thunar.enable = true;
    modules.system.font.enable = true;
    modules.system.sound.enable = true;
    modules.system.video.enable = true;

    assertions = [
      {
        assertion = length deviceCfg.monitors > 0;
        message = ''
          At least one monitor in the `config.deviceCfg.monitors` is
          needed to use Sway module.
        '';
      }
    ];

    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = if (deviceCfg.gpu == "nvidia")
            then "${greetdSwayNvidia}"
            else "${pkgs.sway}/bin/sway";
        };
        default_session = {
          command = if (deviceCfg.gpu == "nvidia")
            then "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${greetdSwayNvidia}"
            else "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${pkgs.sway}/bin/sway";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      at-spi2-core
      libappindicator-gtk3
      libappindicator-gtk2
      libappindicator
      wl-clipboard
      xdg-utils
    ] ++ [
      myPkgs.configure-gtk
      myPkgs.rofi-firefox-wrapper
    ];

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

    services.dbus.enable = true;
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
    };

    networking.networkmanager.enable = true;
    programs.dconf.enable = true;
    programs.xwayland.enable = true;
  };
}
