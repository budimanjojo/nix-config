{
  bindm = [
    # Super+mouse to drag/resize floating windows
    "$super, mouse:272, movewindow"
    "$super, mouse:273, resizewindow"
  ];
  bind = [
    # Kill focused window
    "$super, F4, killactive,"

    # Change focus around
    "$super, $left, movefocus, l"
    "$super, $down, movefocus, d"
    "$super, $up, movefocus, u"
    "$super, $right, movefocus, r"
    # Or use arrow keys
    "$super, left, movefocus, l"
    "$super, down, movefocus, d"
    "$super, up, movefocus, u"
    "$super, right, movefocus, r"

    # Move the focused window with the same, but add Shift
    "$super SHIFT, $left, movewindow, l"
    "$super SHIFT, $down, movewindow, d"
    "$super SHIFT, $up, movewindow, u"
    "$super SHIFT, $right, movewindow, r"
    # Or use arrow keys
    "$super SHIFT, left, movewindow, l"
    "$super SHIFT, down, movewindow, d"
    "$super SHIFT, up, movewindow, u"
    "$super SHIFT, right, movewindow, r"

    # Next/previous workspace
    "$super, tab, workspace, e+1"
    "$super SHIFT, tab, workspace, e-1"

    # Toggle fullscreen mode
    "$super SHIFT, f, fullscreen, 1"

    # Toggle floating mode
    "$super SHIFT, space, togglefloating,"

    # Move the currently focused window to the scratchpad
    "$super SHIFT, p, movetoworkspacesilent, special"

    # Show the next scratchpad window or hide the focused scratchpad window
    "$super, p, togglespecialworkspace,"

    # Switch to workspace
    "$super, 1, workspace, 1"
    "$super, 2, workspace, 2"
    "$super, 3, workspace, 3"
    "$super, 4, workspace, 4"
    "$super, 5, workspace, 5"
    "$super, 6, workspace, 6"
    "$super, 7, workspace, 7"
    "$super, 8, workspace, 8"
    "$super, 9, workspace, 9"
    "$super, 0, workspace, 10"

    # Move focused container to workspace
    "$super SHIFT, 1, movetoworkspace, 1"
    "$super SHIFT, 2, movetoworkspace, 2"
    "$super SHIFT, 3, movetoworkspace, 3"
    "$super SHIFT, 4, movetoworkspace, 4"
    "$super SHIFT, 5, movetoworkspace, 5"
    "$super SHIFT, 6, movetoworkspace, 6"
    "$super SHIFT, 7, movetoworkspace, 7"
    "$super SHIFT, 8, movetoworkspace, 8"
    "$super SHIFT, 9, movetoworkspace, 9"
    "$super SHIFT, 0, movetoworkspace, 10"

    # Reload the configuration file
    "$super SHIFT, c, execr, hyprctl reload"

    # Most used applications
    "$super, t, exec, $terminal"
    "$super, w, exec, $browser"
    "$super, f, exec, $filemanager"

    # Rofi as dmenu replacement
    "$super, grave, exec, rofi -show drun"

    # Modes
    "$super SHIFT, r, submap, $resize"
    ", print, submap, $screenshot"

    # Logout menu
    "CTRL $super, delete, exec, nwg-bar"
  ];
}

