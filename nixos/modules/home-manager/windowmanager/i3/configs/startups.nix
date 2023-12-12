{ pkgs }:
[
  { command = "${pkgs.feh}/bin/feh --bg-fill ~/.config/i3/wallpapers/tokyonight01.png"; notification = false; always = true; }
  { command = "${pkgs.xfce.xfce4-power-manager}/bin/xfce4-power-manager"; notification = false; }
  { command = "${pkgs.numlockx}/bin/numlockx"; notification = false; }
]
