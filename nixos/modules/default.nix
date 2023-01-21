# Always add to this file when adding new module
{ inputs, pkgs, config, ... }:

{
  imports = [
    # Device options
    ./device.nix
    # Home manager alias
    ./home-manager.nix

    ./browser/firefox

    ./editor/geany
    ./editor/neovim

    ./homelab/kubernetes

    ./multiplexer/tmux
    ./multiplexer/zellij

    ./program/adb
    ./program/default
    ./program/discord
    ./program/nextcloud
    ./program/obs-studio
    ./program/syncthing
    ./program/yamllint

    ./shell/fish
    ./shell/git
    ./shell/starship

    ./system/cpu
    ./system/font
    ./system/sound
    ./system/video

    ./terminal-emulator/alacritty
    ./terminal-emulator/kitty
    ./terminal-emulator/wezterm

    ./windowmanager/i3
    ./windowmanager/sway
    ./windowmanager/add-on/blueman-applet
    ./windowmanager/add-on/dunst
    ./windowmanager/add-on/gnome-keyring
    ./windowmanager/add-on/gtk-theme
    ./windowmanager/add-on/nm-applet
    ./windowmanager/add-on/pasystray
    ./windowmanager/add-on/picom
    ./windowmanager/add-on/py3status
    ./windowmanager/add-on/rofi
    ./windowmanager/add-on/swayidle
    ./windowmanager/add-on/thunar
    ./windowmanager/add-on/waybar
    ./windowmanager/add-on/xdg
  ];
}
