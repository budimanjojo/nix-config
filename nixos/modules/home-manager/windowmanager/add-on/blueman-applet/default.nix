{ lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.blueman-applet;
  deviceCfg = config.deviceCfg;
in
{
  options.hm-modules.windowmanager.add-on.blueman-applet = {
    enable = mkEnableOption "blueman-applet";
  };

  config = mkIf (cfg.enable && deviceCfg.hasBluetooth) { services.blueman-applet.enable = true; };
}
