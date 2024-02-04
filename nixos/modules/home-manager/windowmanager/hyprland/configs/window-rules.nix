{
  windowrulev2 = [
    # Window floating and layout
    "float, class:^(pavucontrol)$"
    "float, class:^(thunar)$"
    "float, class:^(obs)$"
    "float, class:^(gnome-calculator|org\.gnome\.Calculator)$"
    "float, class:^(pamac-manager)$"
    "float, class:^(eog)$"
    "float, class:^(blueman-manager)$"
    "float, class:^(nm-connection-editor)$"
    "float, class:^(rhythmbox)$"
    "size 1000 640, class:^(rhythmbox)$"
    "float, class:^(syncthingtray)$"
    "float, title:^(Syncthing Tray( \(.*\))?)$"
    "float, title:^(File Transfer*)$"
    "float, title:^(Lxappearance)$"
    "pin, title:^(Lxappearance)$"
    "float, title:^(VirtualBox)$"
    "float, title:^(VirtualBox)$"
    "idleinhibit focus, fullscreen:1"
    "idleinhibit focus, class:^(org.libretro.RetroArch)$"

    # Window placement
    "workspace silent special, title:^(updater)$, class:^(kitty)$"
    "workspace 5, class:^(smplayer)$"
    "workspace 5, class:^(totem)$"
    "workspace 5, class:^(rhythmbox)$"
    "workspace 6, class:^(org.libretro.RetroArch)$"
    "workspace 7, class:^(Gimp)$"
    "workspace 9, class:^(obs)$"
    "workspace 10, class:^(VirtualBox)$"
    "noborder, title:^(Syncthing Tray( \(.*\))?)$"
    "size 550 400, title:^(Syncthing Tray( \(.*\))?)$"
    "move 1365 30, title:^(Syncthing Tray( \(.*\))?)$"
    "move 1465 30, title:^(Nextcloud)$, class:^(Nextcloud)$"
  ];
}
