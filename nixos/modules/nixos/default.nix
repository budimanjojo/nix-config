{
  imports = [
    # Device options
    ../device.nix

    ./homelab/diy-keyboard

    ./monitoring/grafana
    ./monitoring/prometheus
    ./monitoring/smartd

    ./program/adb
    ./program/default
    ./program/hugo
    ./program/msmtp

    ./shell/fish
    ./shell/lf
    ./shell/openssh

    ./system/cpu
    ./system/font
    ./system/sound
    ./system/video

    ./windowmanager/add-on/blueman-applet
    ./windowmanager/add-on/gnome-keyring
    ./windowmanager/add-on/polkit-gnome
    ./windowmanager/add-on/thunar

    ./windowmanager/i3
    ./windowmanager/hyprland
    ./windowmanager/sway
  ];
}
