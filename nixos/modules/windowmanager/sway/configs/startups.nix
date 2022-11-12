{ pkgs }:
[
  {
    command = ''
      swayidle -w \
        timeout 1800 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"'
    ''; always = true;
  }
  { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; always = false; }
  # {
  #   command = "systemctl --user import-environment";
  #   always = false;
  # }
]
