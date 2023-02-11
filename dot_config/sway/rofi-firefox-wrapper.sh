#!/usr/bin/env bash

cfgFile=$HOME/.mozilla/firefox/profiles.ini

if test -f "$cfgFile"; then
  i=0
  profiles=$(grep 'Name' "$cfgFile" | sed 's/Name=//g')

  while read -r; do
    i=$((i+1))
  done < <(echo "$profiles")

  if [ $i -gt 1 ]; then
    options=$(echo "$profiles" | sed ':a; N; $!ba; s/\n/\\n/g')
    chosen=$(echo -e "$options" | rofi -dmenu -P "Select Firefox Profile")
    if [ "$chosen" != "" ]; then
      firefox -P "$chosen"
    fi
  else
    firefox
  fi
else
  firefox
fi
