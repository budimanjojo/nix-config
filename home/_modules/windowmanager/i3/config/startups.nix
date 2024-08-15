{
  config,
  pkgs,
  lib,
}:
let
  wallpapers = builtins.map (m: m.wallpaper) (
    builtins.filter (m: m.wallpaper != null) config.myHardware.monitors
  );
in
[
  {
    # "xrandr --pos <x>x<y> --mode <width>x<height> ..."
    command =
      "${pkgs.xorg.xrandr}/bin/xrandr"
      + (lib.concatMapStrings (
        mon:
        " --output ${mon.xname} --pos ${toString mon.x}x${toString mon.y} --mode ${toString mon.width}x${toString mon.height}"
        + (lib.optionalString (mon.primary) " --primary")
      ) config.myHardware.monitors);
    notification = false;
    always = true;
  }
  {
    # "feh --bg-fill <path> ..."
    command = "${pkgs.feh}/bin/feh" + (lib.concatMapStrings (wp: " --bg-fill ${wp}")) wallpapers;
    notification = false;
    always = true;
  }
  {
    command = "${pkgs.xfce.xfce4-power-manager}/bin/xfce4-power-manager";
    notification = false;
  }
  {
    command = "${pkgs.numlockx}/bin/numlockx";
    notification = false;
  }
]
