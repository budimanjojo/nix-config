{ pkgs }:
[
  { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; always = false; }
  { command = "${pkgs.sway-contrib.inactive-windows-transparency}/bin/inactive-windows-transparency.py -o 0.9"; always = true; }
  # {
  #   command = "systemctl --user import-environment";
  #   always = false;
  # }
]
