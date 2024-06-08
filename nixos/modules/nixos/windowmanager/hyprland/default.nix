{
  pkgs,
  lib,
  config,
  myPkgs,
  ...
}:
with lib;
let
  cfg = config.modules.windowmanager.hyprland;
  deviceCfg = config.deviceCfg;
in
{
  options.modules.windowmanager.hyprland = {
    enable = mkEnableOption "hyprland";
  };

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
          needed to use Hyprland module.
        '';
      }
    ];

    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "${config.programs.hyprland.package}/bin/Hyprland";
        };
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${config.programs.hyprland.package}/bin/Hyprland";
        };
      };
    };

    environment.systemPackages =
      with pkgs;
      [
        at-spi2-core
        libappindicator-gtk3
        libappindicator-gtk2
        libappindicator
        wl-clipboard
        xdg-utils
      ]
      ++ [
        myPkgs.configure-gtk
        myPkgs.rofi-firefox-wrapper
      ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.dbus.enable = true;
    networking.networkmanager.enable = true;
    # Needed for swaylock to work
    security.pam.services.swaylock = { };
  };
}
