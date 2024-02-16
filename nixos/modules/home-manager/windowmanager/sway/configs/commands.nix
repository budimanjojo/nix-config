[
  # Window title formatting
  {
    criteria = { class = ".*"; };
    command = "title_format \"<b> %title</b>\"";
  }
  # window floating and layout
  {
    criteria = { window_role = "pop-up"; };
    command = "floating enable";
  }
  {
    criteria = { window_role = "prefwindow"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "pavucontrol"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "thunar"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "obs"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "(gnome-calculator)|(org\.gnome\.Calculator)"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "pamac-manager"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "eog"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "blueman-manager"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "nm-connection-editor"; };
    command = "floating enable";
  }
  {
    criteria = { app_id = "rhythmbox"; };
    command = "floating enable, resize set 1000 640";
  }
  {
    criteria = { title = "File Transfer*"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Lxappearance"; };
    command = "floating enable, sticky enable";
  }
  {
    criteria = { class = "VirtualBox"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Steam"; };
    command = "layout tabbed";
  }

  # window placement
  {
    criteria = { title = "updater"; app_id = "kitty"; };
    command = "move container to scratchpad";
  }
  {
    criteria = { app_id = "retroarch"; };
    command = "move container to workspace $ws6, focus";
  }
  {
    criteria = { class = "Gimp"; };
    command = "move container to workspace $ws7, focus";
  }
  {
    criteria = { app_id = "obs"; };
    command = "move container to workspace $ws9, focus";
  }
  {
    criteria = { app_id = "smplayer"; };
    command = "move container to workspace $ws5, focus";
  }
  {
    criteria = { app_id = "totem"; };
    command = "move container to workspace $ws5, focus";
  }
  {
    criteria = { app_id = "rhythmbox"; };
    command = "move container to workspace $ws5, focus";
  }
  {
    criteria = { class = "VirtualBox"; };
    command = "move container to workspace $ws0, focus";
  }
  {
    criteria = { title = "^Syncthing Tray( \(.*\))?$"; };
    command = "floating enable, border none, resize set 550 400, move position 1350 0";
  }
]
