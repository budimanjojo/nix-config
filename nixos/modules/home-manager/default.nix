{
  imports = [
    # Device options
    ../device.nix

    ./browser/firefox

    ./editor/geany
    ./editor/neovim

    ./homelab/diy-keyboard
    ./homelab/kubernetes

    ./multiplexer/tmux
    ./multiplexer/zellij

    ./program/default
    ./program/beeaccounting
    ./program/discord
    ./program/go
    ./program/hugo
    ./program/nextcloud
    ./program/obs-studio
    ./program/libreoffice
    ./program/syncthing
    ./program/yamllint

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
    ./windowmanager/add-on/swayidle
    ./windowmanager/add-on/swaylock
    ./windowmanager/add-on/waybar
    ./windowmanager/add-on/xdg

    ./windowmanager/hyprland
    ./windowmanager/i3
    ./windowmanager/sway
  ];
}
