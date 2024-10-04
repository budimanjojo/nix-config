{
  config,
  resizeMode,
  pkgs,
}:
{
  bindm = [
    # Super+mouse to drag/resize floating windows
    "SUPER, mouse:272, movewindow"
    "SUPER, mouse:273, resizewindow"
  ];
  bind = [
    # Kill focused window
    "SUPER, F4, killactive,"

    # Change focus around
    "SUPER, h, movefocus, l"
    "SUPER, j, movefocus, d"
    "SUPER, k, movefocus, u"
    "SUPER, l, movefocus, r"
    # Or use arrow keys
    "SUPER, left, movefocus, l"
    "SUPER, down, movefocus, d"
    "SUPER, up, movefocus, u"
    "SUPER, right, movefocus, r"

    # Move the focused window with the same, but add Shift
    "SUPER SHIFT, h, movewindow, l"
    "SUPER SHIFT, j, movewindow, d"
    "SUPER SHIFT, k, movewindow, u"
    "SUPER SHIFT, l, movewindow, r"
    # Or use arrow keys
    "SUPER SHIFT, left, movewindow, l"
    "SUPER SHIFT, down, movewindow, d"
    "SUPER SHIFT, up, movewindow, u"
    "SUPER SHIFT, right, movewindow, r"

    # Next/previous workspace
    "SUPER, tab, workspace, e+1"
    "SUPER SHIFT, tab, workspace, e-1"

    # Toggle fullscreen mode
    "SUPER SHIFT, f, fullscreen, 1"

    # Toggle floating mode
    "SUPER SHIFT, space, togglefloating,"

    # Move the currently focused window to the scratchpad
    "SUPER SHIFT, p, movetoworkspacesilent, special"

    # Show the next scratchpad window or hide the focused scratchpad window
    "SUPER, p, togglespecialworkspace,"

    # Switch to workspace
    "SUPER, 1, workspace, 1"
    "SUPER, 2, workspace, 2"
    "SUPER, 3, workspace, 3"
    "SUPER, 4, workspace, 4"
    "SUPER, 5, workspace, 5"
    "SUPER, 6, workspace, 6"
    "SUPER, 7, workspace, 7"
    "SUPER, 8, workspace, 8"
    "SUPER, 9, workspace, 9"
    "SUPER, 0, workspace, 10"

    # Move focused container to workspace
    "SUPER SHIFT, 1, movetoworkspace, 1"
    "SUPER SHIFT, 2, movetoworkspace, 2"
    "SUPER SHIFT, 3, movetoworkspace, 3"
    "SUPER SHIFT, 4, movetoworkspace, 4"
    "SUPER SHIFT, 5, movetoworkspace, 5"
    "SUPER SHIFT, 6, movetoworkspace, 6"
    "SUPER SHIFT, 7, movetoworkspace, 7"
    "SUPER SHIFT, 8, movetoworkspace, 8"
    "SUPER SHIFT, 9, movetoworkspace, 9"
    "SUPER SHIFT, 0, movetoworkspace, 10"

    # Reload the configuration file
    "SUPER SHIFT, c, execr, hyprctl reload"

    # Most used applications
    "SUPER, f, exec, thunar" # use system provided thunar package
    "SUPER, c, exec, ${pkgs.gnome.gnome-calculator}/bin/gnome-calculator"

    # Rofi as dmenu replacement
    "SUPER, grave, exec, ${config.programs.rofi.package}/bin/rofi -show drun"
    "SUPER, Escape, exec, ${config.programs.rofi.package}/bin/rofi -show drun"

    # Modes
    "SUPER SHIFT, r, submap, ${resizeMode}"

    # Logout menu
    "CTRL SUPER, delete, exec, ${pkgs.nwg-bar}/bin/nwg-bar"
  ];
}
