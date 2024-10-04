{
  config,
  pkgs,
  modes,
}:
let
  super = "Mod4";
in
{
  # kill focused window
  "${super}+F4" = "kill";
  # change focus
  "${super}+h" = "focus left";
  "${super}+j" = "focus down";
  "${super}+k" = "focus up";
  "${super}+l" = "focus right";
  # alternatively, you can use the cursor keys
  "${super}+Left" = "focus left";
  "${super}+Down" = "focus down";
  "${super}+Up" = "focus up";
  "${super}+Right" = "focus right";
  # move focused window
  "${super}+Shift+h" = "move left";
  "${super}+Shift+j" = "move down";
  "${super}+Shift+k" = "move up";
  "${super}+Shift+l" = "move right";
  # alternatively, you can use the cursor keys
  "${super}+Shift+Left" = "move left";
  "${super}+Shift+Down" = "move down";
  "${super}+Shift+Up" = "move up";
  "${super}+Shift+Right" = "move right";
  # split in orientation
  "${super}+Control+h" = "split h; exec notify-send 'tile horizontally'";
  "${super}+Control+v" = "split v; exec notify-send 'tile vertically'";
  "${super}+Control+q" = "split toggle";
  # next/previous workspace
  "${super}+Tab" = "workspace next";
  "${super}+Shift+Tab" = "workspace prev";
  # toggle window border
  "${super}+Control+t" = "border toggle";
  # enter fullscreen mode for the focused container
  "${super}+Control+f" = "fullscreen toggle";
  # toggle gaps on and off, please uncomment if you don't have i3-gaps installed
  "${super}+Control+g" = ''
    exec --no-startup-id "if [ `i3-msg -t get_tree | grep -Po \
      '.*\\"gaps\\":{\\"inner\\":\K(-|)[0-9]+(?=.*\\"focused\\":true)'` -eq 0 ]; then \
              i3-msg gaps inner current set 0; i3-msg gaps outer current set 0; \
      else \
              i3-msg gaps inner current set 10; i3-msg gaps outer current set 5; \
      fi
  '';
  # change container layout (stacked, tabbed, toggle split)
  "${super}+Control+s" = "layout stacking";
  "${super}+Control+w" = "layout tabbed";
  "${super}+Control+e" = "layout toggle split";
  # toggle floating mode
  "${super}+Shift+space" = "floating toggle";
  # change focus between tiling / floating windows
  "${super}+space" = "focus mode_toggle";
  # switch to workspace
  "${super}+1" = "workspace 1";
  "${super}+2" = "workspace 2";
  "${super}+3" = "workspace 3";
  "${super}+4" = "workspace 4";
  "${super}+5" = "workspace 5";
  "${super}+6" = "workspace 6";
  "${super}+7" = "workspace 7";
  "${super}+8" = "workspace 8";
  "${super}+9" = "workspace 9";
  "${super}+0" = "workspace 10";
  # move focused container to workspace
  "${super}+Shift+1" = "move container to workspace 1";
  "${super}+Shift+2" = "move container to workspace 2";
  "${super}+Shift+3" = "move container to workspace 3";
  "${super}+Shift+4" = "move container to workspace 4";
  "${super}+Shift+5" = "move container to workspace 5";
  "${super}+Shift+6" = "move container to workspace 6";
  "${super}+Shift+7" = "move container to workspace 7";
  "${super}+Shift+8" = "move container to workspace 8";
  "${super}+Shift+9" = "move container to workspace 9";
  "${super}+Shift+0" = "move container to workspace 10";
  # reload the configuration file
  "${super}+Shift+c" = "reload";
  # exit i3 (logs you out of your X session)
  "${super}+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"";
  # most used application shortcuts
  "${super}+f" = "exec --no-startup-id thunar"; # use system provided thunar package
  "${super}+c" = "exec ${pkgs.gnome.gnome-calculator}/bin/gnome-calculator";
  # rofi as dmenu replacement
  "${super}+grave" = "exec ${config.programs.rofi.package}/bin/rofi -show drun";
  "${super}+Escape" = "exec ${config.programs.rofi.package}/bin/rofi -show drun";
  # modes
  "${super}+Shift+r" = "mode \"${modes.resize}\"";
  "${super}+Shift+g" = "mode \"${modes.gaps}\"";
  "${super}+Control+Delete" = "mode \"${modes.system}\"";
}
