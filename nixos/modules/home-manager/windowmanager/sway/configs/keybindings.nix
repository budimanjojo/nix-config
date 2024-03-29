{
  # Kill focused window
  "$super+F4" = "kill";
  # Change focus around
  "$super+h" = "focus left";
  "$super+j" = "focus down";
  "$super+k" = "focus up";
  "$super+l" = "focus right";
  # Or use arrow keys
  "$super+Left" = "focus left";
  "$super+Down" = "focus down";
  "$super+Up" = "focus up";
  "$super+Right" = "focus right";
  # Move the focused window with the same, but add Shift
  "$super+Shift+h" = "move left";
  "$super+Shift+j" = "move down";
  "$super+Shift+k" = "move up";
  "$super+Shift+l" = "move right";
  # Or use arrow keys
  "$super+Shift+Left" = "move left";
  "$super+Shift+Down" = "move down";
  "$super+Shift+Up" = "move up";
  "$super+Shift+Right" = "move right";
  # Split current container
  "$super+Control+h" = "splith; exec notify-send 'tile horizontally'";
  "$super+Control+v" = "splitv; exec notify-send 'tile vertically'";
  "$super+Control+q" = "split toggle";
  # Next/previous workspace
  "$super+Tab" = "workspace next";
  "$super+Shift+Tab" = "workspace prev";
  # Toggle window border
  "$super+Control+t" = "border toggle";
  # toggle gaps on and off
  "$super+Control+g" = ''
    exec "if [ `swaymsg -t get_tree | grep -Po \
      '.*\\"gaps\\":{\\"inner\\":\K(-|)[0-9]+(?=.*\\"focused\\":true)'` -eq 0 ]; then \
              swaymsg gaps inner current set 0; swaymsg gaps outer current set 0; \
      else \
              swaymsg gaps inner current set 10; swaymsg gaps outer current set 5; \
      fi
  '';
  # Toggle fullscreen mode
  "$super+Shift+f" = "fullscreen toggle";
  # Change container layout
  "$super+Control+s" = "layout stacking";
  "$super+Control+w" = "layout tabbed";
  "$super+Control+e" = "layout toggle split";
  # Toggle floating mode
  "$super+Shift+space" = "floating toggle";
  # Swap focus between tiling / floating windows
  "$super+space" = "focus mode_toggle";
  # Focus the parent container
  #"$super+a" = "focus parent";
  # Focus the child container
  #"$super+d" = "focus child";
  # Move the currently focused window to the scratchpad
  "$super+Shift+p" = "move scratchpad";
  # Show the next scratchpad window or hide the focused scratchpad window.
  "$super+p" = "scratchpad show";
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
  "$super+Escape" = "exec rofi -show drun";
  # Modes
  "$super+Shift+r" = "mode \"$resize\"";
  "$super+Shift+g" = "mode \"$gaps\"";
  "Print" = "mode \"$screenshot\"";
  # Logout menu
  "$super+Control+Delete" = "exec nwg-bar";
}
