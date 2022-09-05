#!/bin/sh

if [ "$(hyprctl getoption general:border_size)" = 0 ]; then
  hyperctl keyword general:border_size 5
else
  hyperctl keyword general:border_size 0
fi
