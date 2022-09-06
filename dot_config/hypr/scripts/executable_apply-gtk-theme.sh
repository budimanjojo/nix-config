#!/bin/bash

gsettings set org.gnome.desktop.interface gtk-theme "$gtktheme" &&
gsettings set org.gnome.desktop.interface icon-theme "$icontheme" &&
gsettings set org.gnome.desktop.interface cursor-theme "$cursortheme" &&
gsettings set org.gnome.desktop.interface font-name "$fontname" &&
gsettings set org.gnome.desktop.wm.preferences button-layout ':appmenu'
