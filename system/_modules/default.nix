{ lib, ... }:
{
  imports = [
    # contains config.myHardware options
    # in a separate file because this module is shared with home-manager
    ./myHardware.nix

    # base module enabled for all hosts
    ./_default

    ./containers/beeaccounting

    ./displaymanager/sddm

    ./programs/adb
    ./programs/hugo
    ./programs/msmtp
    ./programs/nh
    ./programs/qmk

    ./services/btrfs-autoscrub
    ./services/grafana
    ./services/openssh
    ./services/prometheus
    ./services/smartd

    ./system/autoupgrade
    ./system/bootloader
    ./system/cpu
    ./system/font
    ./system/sound
    ./system/video

    ./windowmanager/add-on/blueman
    ./windowmanager/add-on/gnome-keyring
    ./windowmanager/add-on/networkmanager
    ./windowmanager/add-on/polkit-gnome
    ./windowmanager/add-on/thunar
    ./windowmanager/hyprland
    ./windowmanager/i3
    ./windowmanager/sway
  ];

  options.mySystem = with lib; {
    adminUser = mkOption {
      type = types.str;
      default = "";
    };
    isWayland = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
