{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.nm-applet;
in {
  options.modules.windowmanager.add-on.nm-applet = { enable = mkEnableOption "nm-applet"; };

  config = mkIf cfg.enable {
    home.manager = {
      services.network-manager-applet.enable = true;
      xsession.preferStatusNotifierItems = true;
    };
  };
}
