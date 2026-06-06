[
  # Window title formatting
  {
    criteria = {
      class = ".*";
    };
    command = "title_format \"<b> %title</b>\"";
  }
  # window floating and layout
  {
    criteria = {
      window_role = "pop-up";
    };
    command = "floating enable";
  }
  {
    criteria = {
      window_role = "prefwindow";
    };
    command = "floating enable";
  }
  {
    criteria = {
      app_id = "pavucontrol";
    };
    command = "floating enable";
  }
  {
    criteria = {
      app_id = "thunar";
    };
    command = "floating enable";
  }
  {
    criteria = {
      app_id = "obs";
    };
    command = "floating enable";
  }
  {
    criteria = {
      app_id = "(gnome-calculator)|(org\.gnome\.Calculator)";
    };
    command = "floating enable";
  }
  {
    criteria = {
      app_id = "eog";
    };
    command = "floating enable";
  }
  {
    criteria = {
      app_id = "blueman-manager";
    };
    command = "floating enable";
  }
  {
    criteria = {
      app_id = "nm-connection-editor";
    };
    command = "floating enable";
  }
  {
    criteria = {
      app_id = "rhythmbox";
    };
    command = "floating enable, resize set 1000 640";
  }
  {
    criteria = {
      title = "File Transfer*";
    };
    command = "floating enable";
  }
  {
    criteria = {
      class = "Lxappearance";
    };
    command = "floating enable, sticky enable";
  }
  {
    criteria = {
      class = "VirtualBox";
    };
    command = "floating enable";
  }

  # window placement
  {
    criteria = {
      app_id = "retroarch";
    };
    command = "move container to workspace 6, focus";
  }
  {
    criteria = {
      class = "Gimp";
    };
    command = "move container to workspace 7, focus";
  }
  {
    criteria = {
      app_id = "obs";
    };
    command = "move container to workspace 9, focus";
  }
  {
    criteria = {
      class = "VirtualBox";
    };
    command = "move container to workspace 10, focus";
  }
  {
    criteria = {
      title = "^Syncthing Tray( \(.*\))?$";
    };
    command = "floating enable, border none, resize set 550 400, move position 1350 0";
  }
]
