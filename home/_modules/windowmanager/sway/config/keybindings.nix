{
  config,
  modes,
  pkgs,
}:
let
  super = "Mod4";
in
{
  # Kill focused window
  "${super}+F4" = "kill";
  # Change focus around
  "${super}+h" = "focus left";
  "${super}+j" = "focus down";
  "${super}+k" = "focus up";
  "${super}+l" = "focus right";
  # Or use arrow keys
  "${super}+Left" = "focus left";
  "${super}+Down" = "focus down";
  "${super}+Up" = "focus up";
  "${super}+Right" = "focus right";
  # Move the focused window with the same, but add Shift
  "${super}+Shift+h" = "move left";
  "${super}+Shift+j" = "move down";
  "${super}+Shift+k" = "move up";
  "${super}+Shift+l" = "move right";
  # Or use arrow keys
  "${super}+Shift+Left" = "move left";
  "${super}+Shift+Down" = "move down";
  "${super}+Shift+Up" = "move up";
  "${super}+Shift+Right" = "move right";
  # Split current container
  "${super}+Control+h" = "splith; exec notify-send 'tile horizontally'";
  "${super}+Control+v" = "splitv; exec notify-send 'tile vertically'";
  "${super}+Control+q" = "split toggle";
  # Next/previous workspace
  "${super}+Tab" = "workspace next";
  "${super}+Shift+Tab" = "workspace prev";
  # Toggle window border
  "${super}+Control+t" = "border toggle";
  # toggle gaps on and off
  "${super}+Control+g" = ''
    exec "if [ `swaymsg -t get_tree | grep -Po \
      '.*\\"gaps\\":{\\"inner\\":\K(-|)[0-9]+(?=.*\\"focused\\":true)'` -eq 0 ]; then \
              swaymsg gaps inner current set 0; swaymsg gaps outer current set 0; \
      else \
              swaymsg gaps inner current set 10; swaymsg gaps outer current set 5; \
      fi
  '';
  # Toggle fullscreen mode
  "${super}+Shift+f" = "fullscreen toggle";
  # Change container layout
  "${super}+Control+s" = "layout stacking";
  "${super}+Control+w" = "layout tabbed";
  "${super}+Control+e" = "layout toggle split";
  # Toggle floating mode
  "${super}+Shift+space" = "floating toggle";
  # Swap focus between tiling / floating windows
  "${super}+space" = "focus mode_toggle";
  # Focus the parent container
  #"${super}+a" = "focus parent";
  # Focus the child container
  #"${super}+d" = "focus child";
  # Move the currently focused window to the scratchpad
  "${super}+Shift+p" = "move scratchpad";
  # Show the next scratchpad window or hide the focused scratchpad window.
  "${super}+p" = "scratchpad show";
  # Switch to workspace
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
  # Move focused container to workspace
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
  # Reload the configuration file
  "${super}+Shift+c" = "reload";
  # Exit sway (logs you out of your Wayland session)
  "${super}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
  # Most used applications
  "${super}+f" = "exec thunar"; # use system provided thunar package
  "${super}+c" = "exec ${pkgs.gnome-calculator}/bin/gnome-calculator";
  # Rofi as dmenu replacement
  "${super}+grave" = "exec ${config.programs.rofi.package}/bin/rofi -show drun";
  "${super}+Escape" = "exec ${config.programs.rofi.package}/bin/rofi -show drun";
  # Modes
  "${super}+Shift+r" = "mode \"${modes.resize}\"";
  "${super}+Shift+g" = "mode \"${modes.gaps}\"";
  # Logout menu
  "${super}+Control+Delete" = "exec ${pkgs.nwg-bar}/bin/nwg-bar";
}
