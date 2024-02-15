{ ... }:
{
  # Resize  window
  "$resize" = {
    "h" = "resize shrink width";
    "j" = "resize grow height";
    "k" = "resize shrink height";
    "l" = "resize grow width";
    # Or use arrow keys
    "Left" = "resize shrink width";
    "Down" = "resize grow height";
    "Up" = "resize shrink height";
    "Right" = "resize grow width";
    # Return to normal mode
    "Return" = "mode default";
    "Escape" = "mode default";
  };
  # Resize gaps
  "$gaps" = {
    "o" = "mode \"$gaps_outer\"";
    "i" = "mode \"$gaps_inner\"";
    # Return to normal mode
    "Return" = "mode default";
    "Escape" = "mode default";
  };
  "$gaps_outer" = {
    "k" = "gaps outer current plus 5";
    "j" = "gaps outer current minus 5";
    "Shift+k" = "gaps outer all plus 5";
    "Shift+j" = "gaps outer all minus 5";
    # Or use arrow keys
    "Up" = "gaps outer current plus 5";
    "Down" = "gaps outer current minus 5";
    "Shift+Up" = "gaps outer all plus 5";
    "Shift+Down" = "gaps outer all minus 5";
    # Return to gaps/normal mode
    "Return" = "mode \"$gaps\"";
    "Escape" = "mode default";
  };
  "$gaps_inner" = {
    "k" = "gaps inner current plus 5";
    "j" = "gaps inner current minus 5";
    "Shift+k" = "gaps inner all plus 5";
    "Shift+j" = "gaps inner all minus 5";
    # Or use arrow keys
    "Up" = "gaps inner current plus 5";
    "Down" = "gaps inner current minus 5";
    "Shift+Up" = "gaps inner all plus 5";
    "Shift+Down" = "gaps inner all minus 5";
    # Return to gaps/normal mode
    "Return" = "mode \"$gaps\"";
    "Escape" = "mode default";
  };
  # Take a screenshot with grim, put it in Desktop folder
  "$screenshot" = {
    "Return" = "exec $grim_capture && pw-cat -p ~/.config/sway/sounds/camera-shutter.oga && notify-send \"Screenshot saved in your Desktop folder\", mode default";

    "--release s" = "exec $grim_region && pw-cat -p ~/.config/sway/sounds/camera-shutter.oga && notify-send \"Screenshot saved in your Desktop folder\", mode default";
    "Escape" = "mode default";
  };
}
