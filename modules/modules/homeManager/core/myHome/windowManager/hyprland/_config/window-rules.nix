{
  windowrule = [
    # Window float oning and layout
    "float on, match:class ^(pavucontrol)$"
    "float on, match:class ^(thunar)$"
    "float on, match:class ^(obs)$"
    "float on, match:class ^(gnome-calculator|org\.gnome\.Calculator)$"
    "float on, match:class ^(pamac-manager)$"
    "float on, match:class ^(eog)$"
    "float on, match:class ^(blueman-manager)$"
    "float on, match:class ^(nm-connection-editor)$"
    "float on, match:class ^(rhythmbox)$"
    "size 1000 640, match:class ^(rhythmbox)$"
    "float on, match:title ^(File Transfer*)$"
    "float on, match:title ^(Lxappearance)$"
    "pin on, match:title ^(Lxappearance)$"
    "float on, match:title ^(VirtualBox)$"
    "float on, match:title ^(VirtualBox)$"
    "idle_inhibit focus, match:fullscreen 1"
    "idle_inhibit focus, match:class ^(org.libretro.RetroArch)$"
    "idle_inhibit focus, match:class ^(com.github.iwalton3.jellyfin-media-player)$"

    # Window placement
    "workspace silent special, match:title ^(updater)$, match:class ^(kitty)$"
    "workspace 5, match:class ^(smplayer)$"
    "workspace 5, match:class ^(totem)$"
    "workspace 5, match:class ^(rhythmbox)$"
    "workspace 6, match:class ^(org.libretro.RetroArch)$"
    "workspace 7, match:class ^(Gimp)$"
    "workspace 9, match:class ^(obs)$"
    "workspace 10, match:class ^(VirtualBox)$"
    "border_size 0, match:title ^(Syncthing Tray( \(.*\))?)$"
    "size 550 400, match:title ^(Syncthing Tray( \(.*\))?)$"
    "move 1365 30, match:title ^(Syncthing Tray( \(.*\))?)$"
    "move 1465 30, match:title ^(Nextcloud)$, match:class ^(Nextcloud)$"
  ];
}
