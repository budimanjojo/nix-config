{ pkgs, lib, config, myPkgs, ... }:
with lib;
let 
  cfg = config.modules.windowmanager.sway;
  deviceCfg = config.deviceCfg;
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
          command = "${pkgs.sway}/bin/sway";
        };
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${pkgs.sway}/bin/sway";
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

    programs.sway.enable = true;
    programs.sway.wrapperFeatures.gtk = true;

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
