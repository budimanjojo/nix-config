{
  # Kill focused window
  "$alt+F4" = "kill";
  "$super+F4" = "kill";
  # Change focus around
  "$alt+h" = "focus left";
  "$alt+j" = "focus down";
  "$alt+k" = "focus up";
  "$alt+l" = "focus right";
  # Or use arrow keys
  "$alt+Left" = "focus left";
  "$alt+Down" = "focus down";
  "$alt+Up" = "focus up";
  "$alt+Right" = "focus right";
  # Move the focused window with the same, but add Shift
  "$alt+Shift+h" = "move left";
  "$alt+Shift+j" = "move down";
  "$alt+Shift+k" = "move up";
  "$alt+Shift+l" = "move right";
  # Or use arrow keys
  "$alt+Shift+Left" = "move left";
  "$alt+Shift+Down" = "move down";
  "$alt+Shift+Up" = "move up";
  "$alt+Shift+Right" = "move right";
  # Split current container
  "$alt+Control+h" = "splith; exec notify-send 'tile horizontally'";
  "$alt+Control+v" = "splitv; exec notify-send 'tile vertically'";
  "$alt+Control+q" = "split toggle";
  # Next/previous workspace
  "$super+Tab" = "workspace next";
  "$super+Shift+Tab" = "workspace prev";
  # Toggle window border
  "$alt+Control+t" = "border toggle";
  # toggle gaps on and off
  "$alt+Control+g" = ''
    exec "if [ `swaymsg -t get_tree | grep -Po \
      '.*\\"gaps\\":{\\"inner\\":\K(-|)[0-9]+(?=.*\\"focused\\":true)'` -eq 0 ]; then \
              swaymsg gaps inner current set 0; swaymsg gaps outer current set 0; \
      else \
              swaymsg gaps inner current set 10; swaymsg gaps outer current set 5; \
      fi
  '';
  # Toggle fullscreen mode
  "$alt+Control+f" = "fullscreen toggle";
  # Change container layout
  "$alt+Control+s" = "layout stacking";
  "$alt+Control+w" = "layout tabbed";
  "$alt+Control+e" = "layout toggle split";
  # Toggle floating mode
  "$super+Shift+space" = "floating toggle";
  # Swap focus between tiling / floating windows
  "$super+space" = "focus mode_toggle";
  # Focus the parent container
  #"$super+a" = "focus parent";
  # Focus the child container
  #"$super+d" = "focus child";
  # Move the currently focused window to the scratchpad
  "$super+Shift+minus" = "move scratchpad";
  # Show the next scratchpad window or hide the focused scratchpad window.
  "$super+minus" = "scratchpad show";
  # Switch to workspace
  "$super+1" = "workspace $ws1";
  "$super+2" = "workspace $ws2";
  "$super+3" = "workspace $ws3";
  "$super+4" = "workspace $ws4";
  "$super+5" = "workspace $ws5";
  "$super+6" = "workspace $ws6";
  "$super+7" = "workspace $ws7";
  "$super+8" = "workspace $ws8";
  "$super+9" = "workspace $ws9";
  "$super+0" = "workspace $ws0";
  # Move focused container to workspace
  "$super+Shift+1" = "move container to workspace $ws1";
  "$super+Shift+2" = "move container to workspace $ws2";
  "$super+Shift+3" = "move container to workspace $ws3";
  "$super+Shift+4" = "move container to workspace $ws4";
  "$super+Shift+5" = "move container to workspace $ws5";
  "$super+Shift+6" = "move container to workspace $ws6";
  "$super+Shift+7" = "move container to workspace $ws7";
  "$super+Shift+8" = "move container to workspace $ws8";
  "$super+Shift+9" = "move container to workspace $ws9";
  "$super+Shift+0" = "move container to workspace $ws0";
  # Reload the configuration file
  "$super+Shift+c" = "reload";
  # Exit sway (logs you out of your Wayland session)
  "$super+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
  # Most used applications
  "$super+t" = "exec $terminal";
  "$super+w" = "exec $browser --no-default-browser-check";
  "$super+f" = "exec $filemanager";
  "$super+g" = "exec gimp";
  "$super+b" = "exec obs";
  "$super+s" = "exec steam";
  # Rofi as dmenu replacement
  "$super+grave" = "exec rofi -show drun";
  # Modes
  "$alt+Shift+r" = "mode \"$resize\"";
  "$alt+Shift+g" = "mode \"$gaps\"";
  "$alt+Control+Delete" = "mode \"$system\"";
  "Print" = "mode \"$screenshot\"";
}
