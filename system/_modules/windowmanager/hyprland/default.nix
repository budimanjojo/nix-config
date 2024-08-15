{
  pkgs,
  lib,
  config,
  myPkgs,
  ...
}:
let
  cfg = config.mySystem.windowmanager.hyprland;
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    ;
in
{
  options.mySystem.windowmanager.hyprland = {
    enable = mkEnableOption "Hyprland window manager";
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

      displaymanager.sddm = {
        enable = true;
        defaultSession = mkIf (cfg.isDefaultSession) "hyprland";
      };
      system = {
        font.enable = true;
        sound.enable = true;
        video.enable = true;
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
