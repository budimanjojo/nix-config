{ config, lib, ... }:
let
  myHome = config.myHome;
  cfg = myHome.windowmanager.add-on.blueman-applet;
in
{
  options.myHome.windowmanager.add-on.blueman-applet = {
    enable = lib.mkEnableOption "blueman-applet";
  };

  config = lib.mkIf (cfg.enable) { services.blueman-applet.enable = true; };
}
