#!/bin/bash

handle() {
  if [[ "${1:0:12}" = "monitoradded" ]]; then
    hyprctl dispatch moveworkspacetomonitor "$ws1 $monleft"
    hyprctl dispatch moveworkspacetomonitor "$ws2 $monright"
    hyprctl dispatch moveworkspacetomonitor "$ws3 $monleft"
    hyprctl dispatch moveworkspacetomonitor "$ws4 $monright"
    hyprctl dispatch moveworkspacetomonitor "$ws5 $monleft"
    hyprctl dispatch moveworkspacetomonitor "$ws6 $monright"
    hyprctl dispatch moveworkspacetomonitor "$ws7 $monleft"
    hyprctl dispatch moveworkspacetomonitor "$ws8 $monright"
    hyprctl dispatch moveworkspacetomonitor "$ws9 $monleft"
    hyprctl dispatch moveworkspacetomonitor "$ws0 $monright"
  fi
}

socat - UNIX-CONNECT:/tmp/hypr/"$(echo $HYPRLAND_INSTANCE_SIGNATURE)"/.socket2.sock | while read -r line; do handle "$line"; done
