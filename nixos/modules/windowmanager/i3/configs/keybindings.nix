{
  # kill focused window
  "$alt+F4" = "kill";
  # change focus
  "$alt+h" = "focus left";
  "$alt+j" = "focus down";
  "$alt+k" = "focus up";
  "$alt+l" = "focus right";
  # alternatively, you can use the cursor keys
  "$alt+Left" = "focus left";
  "$alt+Down" = "focus down";
  "$alt+Up" = "focus up";
  "$alt+Right" = "focus right";
  # move focused window
  "$alt+Shift+h" = "move left";
  "$alt+Shift+j" = "move down";
  "$alt+Shift+k" = "move up";
  "$alt+Shift+l" = "move right";
  # alternatively, you can use the cursor keys
  "$alt+Shift+Left" = "move left";
  "$alt+Shift+Down" = "move down";
  "$alt+Shift+Up" = "move up";
  "$alt+Shift+Right" = "move right";
  # split in orientation
  "$alt+Control+h" = "split h; exec notify-send 'tile horizontally'";
  "$alt+Control+v" = "split v; exec notify-send 'tile vertically'";
  "$alt+Control+q" = "split toggle";
  # next/previous workspace
  "$super+Tab" = "workspace next";
  "$super+Shift+Tab" = "workspace prev";
  # toggle window border
  "$alt+Control+t" = "border toggle";
  # enter fullscreen mode for the focused container
  "$alt+Control+f" = "fullscreen toggle";
  # toggle gaps on and off, please uncomment if you don't have i3-gaps installed
  "$alt+Control+g" = ''
    exec --no-startup-id "if [ `i3-msg -t get_tree | grep -Po \
      '.*\\"gaps\\":{\\"inner\\":\K(-|)[0-9]+(?=.*\\"focused\\":true)'` -eq 0 ]; then \
              i3-msg gaps inner current set 0; i3-msg gaps outer current set 0; \
      else \
              i3-msg gaps inner current set 10; i3-msg gaps outer current set 5; \
      fi
  '';
  # change container layout (stacked, tabbed, toggle split)
  "$alt+Control+s" = "layout stacking";
  "$alt+Control+w" = "layout tabbed";
  "$alt+Control+e" = "layout toggle split";
  # toggle tiling / floating
  "$super+Shift+space" = "floating toggle";
  # change focus between tiling / floating windows
  "$super+space" = "focus mode_toggle";
  # switch to workspace
  "$alt+1" = "workspace $ws1";
  "$alt+2" = "workspace $ws2";
  "$alt+3" = "workspace $ws3";
  "$alt+4" = "workspace $ws4";
  "$alt+5" = "workspace $ws5";
  "$alt+6" = "workspace $ws6";
  "$alt+7" = "workspace $ws7";
  "$alt+8" = "workspace $ws8";
  "$alt+9" = "workspace $ws9";
  "$alt+0" = "workspace $ws10";
  # move focused container to workspace
  "$alt+Shift+1" = "move container to workspace $ws1";
  "$alt+Shift+2" = "move container to workspace $ws2";
  "$alt+Shift+3" = "move container to workspace $ws3";
  "$alt+Shift+4" = "move container to workspace $ws4";
  "$alt+Shift+5" = "move container to workspace $ws5";
  "$alt+Shift+6" = "move container to workspace $ws6";
  "$alt+Shift+7" = "move container to workspace $ws7";
  "$alt+Shift+8" = "move container to workspace $ws8";
  "$alt+Shift+9" = "move container to workspace $ws9";
  "$alt+Shift+0" = "move container to workspace $ws10";
  # reload the configuration file
  "$super+Shift+c" = "reload";
  # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
  "$super+Shift+r" = "restart";
  # exit i3 (logs you out of your X session)
  "$super+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"";
  # most used application shortcuts
  "$super+t" = "exec --no-startup-id $terminal";
  "$super+w" = "exec --no-startup-id $browser";
  "$super+s" = "exec --no-startup-id steam";
  "$super+f" = "exec --no-startup-id $filemanager";
  "$super+m" = "exec --no-startup-id thunderbird";
  "$super+b" = "exec --no-startup-id obs";
  "$super+g" = "exec --no-startup-id gimp";
  "$super+k" = "exec --no-startup-id kdenlive";
  # rofi as dmenu replacement
  "$super+grave" = "exec rofi -show run";
  "$alt+Tab" = "exec rofi -show window";
  # modes
  "$alt+Shift+r" = "mode \"$mode_resize\"";
  "$super+Shift+g" = "mode \"$mode_gaps\"";
  "$alt+Control+Delete" = "mode \"$mode_system\"";
  "Print" = "mode \"$mode_screenshot\"";
}
