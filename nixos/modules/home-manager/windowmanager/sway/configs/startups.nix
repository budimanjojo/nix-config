{ pkgs }:
[
  {
    command = "${pkgs.sway-contrib.inactive-windows-transparency}/bin/inactive-windows-transparency.py -o 0.9";
    always = true;
  }
  # {
  #   command = "systemctl --user import-environment";
  #   always = false;
  # }
]
