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
  { command = "${pkgs.sway-contrib.inactive-windows-transparency}/bin/inactive-windows-transparency.py -o 0.9"; always = true; }
  # {
  #   command = "systemctl --user import-environment";
  #   always = false;
  # }
]
