{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.nm-applet;
in {
  options.hm-modules.windowmanager.add-on.nm-applet = { enable = mkEnableOption "nm-applet"; };

  config = mkIf cfg.enable {
    services.network-manager-applet.enable = true;
    xsession.preferStatusNotifierItems = true;
  };
}
