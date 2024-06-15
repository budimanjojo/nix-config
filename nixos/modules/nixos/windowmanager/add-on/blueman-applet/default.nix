{ lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.blueman-applet;
  deviceCfg = config.deviceCfg;
in
{
  options.modules.windowmanager.add-on.blueman-applet = {
    enable = mkEnableOption "blueman-applet";
  };

  config = mkIf (cfg.enable && deviceCfg.hasBluetooth) { services.blueman.enable = true; };
}
