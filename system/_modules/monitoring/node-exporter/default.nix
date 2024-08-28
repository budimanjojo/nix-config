{ config, lib, ... }:
let
  cfg = config.mySystem.monitoring.node-exporter;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.mySystem.monitoring.node-exporter = {
    enable = mkEnableOption "Prometheus node exporter";
  };

  config = mkIf (cfg.enable) {
    services = {
      prometheus.exporters.node = {
        enable = true;
        enabledCollectors = [ "systemd" ];
        openFirewall = true;
      };
    };
  };
}
