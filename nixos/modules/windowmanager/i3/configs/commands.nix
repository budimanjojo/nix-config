[
  # window floating and layout
  # {
  #   criteria = { window_type = "dialog,utility,toolbar,splash,menu,dropdown_menu,popup_menu,tooltip,notification,dock"; };
  #   command = "floating enable border pixel 1";
  # }
  {
    criteria = { window_role = "pop-up"; };
    command = "floating enable";
  }
  {
    criteria = { window_role = "prefwindow"; };
    command = "floating enable";
  }
  {
    criteria = { class = "notify"; };
    command = "floating enable border pixel 1";
  }
  {
    criteria = { title = "File Transfer*"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Galculator"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Lxappearance"; };
    command = "floating enable sticky enable border normal";
  }
  {
    criteria = { class = "Nitrogen"; };
    command = "floating enable sticky enable border normal";
  }
  {
    criteria = { class = "Oblogout"; };
    command = "fullscreen enable";
  }
  {
    criteria = { class = "octopi"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Pamac-manager"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Pavucontrol"; };
    command = "floating enable";
  }
  {
    criteria = { class = "VirtualBox"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Skype"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Steam"; };
    command = "layout tabbed";
  }
  {
    criteria = { class = "(?i)nvidia-settings"; };
    command = "floating enable";
  }
  {
    criteria = { class = "smplayer"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Eog"; };
    command = "floating enable";
  }
  {
    criteria = { class = "Rhythmbox"; };
    command = "floating enable resize set 1000 640";
  }
  {
    criteria = { class = "obs"; };
    command = "floating enable";
  }
]
