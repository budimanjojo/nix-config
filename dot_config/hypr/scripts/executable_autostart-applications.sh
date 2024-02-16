#!/bin/bash

pamac-tray &
blueman-applet &
# nwg-dock -d -i 32 -o $monright &
nm-applet --indicator &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# exec xfce4-power-manager
# exec $HOME/.conkyrc/.conkyrci3/start_conky_i3.sh
/usr/bin/nextcloud --background &
