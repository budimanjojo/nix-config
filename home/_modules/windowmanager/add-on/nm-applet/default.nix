{ config, lib, ... }:
let
  cfg = config.myHome.windowmanager.add-on.nm-applet;
in
{
  options.myHome.windowmanager.add-on.nm-applet = {
    enable = lib.mkEnableOption "nm-applet";
  };

  config = lib.mkIf (cfg.enable) {
    services.network-manager-applet.enable = true;
    xsession.preferStatusNotifierItems = true;
  };
}
