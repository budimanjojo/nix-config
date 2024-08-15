{ lib, osConfig, ... }:
let
  inherit (lib)
    mkOption
    types
    mkIf
    myLib
    mkDefault
    ;
in
{
  imports = [
    ../../system/_modules/myHardware.nix
    # base module enabled for all users
    ./_default

    ./browser/firefox

    ./editor/neovim

    ./homelab/kubernetes

    ./multiplexer/tmux
    ./multiplexer/zellij

    ./programs/beeaccounting
    ./programs/chezmoi
    ./programs/obs-studio
    ./programs/qmk
    ./programs/yamllint

    ./services/nextcloud-client

    ./shell/dircolors
    ./shell/fish
    ./shell/git
    ./shell/lf
    ./shell/nix-direnv
    ./shell/starship

    ./terminal-emulator/alacritty
    ./terminal-emulator/kitty
    ./terminal-emulator/wezterm

    ./windowmanager/add-on/blueman-applet
    ./windowmanager/add-on/dunst
    ./windowmanager/add-on/gtk-theme
    ./windowmanager/add-on/nm-applet
    ./windowmanager/add-on/nwg-bar
    ./windowmanager/add-on/pasystray
    ./windowmanager/add-on/picom
    ./windowmanager/add-on/py3status
    ./windowmanager/add-on/rofi
    ./windowmanager/add-on/screenshotter
    ./windowmanager/add-on/swayidle
    ./windowmanager/add-on/swaylock
    ./windowmanager/add-on/theme/tokyonight
    ./windowmanager/add-on/waybar
    ./windowmanager/add-on/xdg

    ./windowmanager/hyprland
    ./windowmanager/i3
    ./windowmanager/sway
  ];

  options.myHome = {
    username = mkOption {
      type = types.str;
      default = "";
    };
    isWayland = mkOption {
      type = types.bool;
      default = false;
    };
  };

  # defaulting to use the system config on NixOS machine
  config.myHardware = mkDefault (myLib.copyFromSystem "myHardware" osConfig);
}
