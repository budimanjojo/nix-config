{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.blueman-applet;
  device = config.modules.device;
in {
  options.modules.windowmanager.add-on.blueman-applet = { enable = mkEnableOption "blueman-applet"; };

  config = mkIf cfg.enable {
    services.blueman.enable = mkIf device.hasBluetooth true;
    home.manager = {
      services.blueman-applet.enable = mkIf device.hasBluetooth true;
    };
  };
}
