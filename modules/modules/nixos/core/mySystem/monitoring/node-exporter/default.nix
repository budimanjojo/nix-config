{
  flake.modules.nixos.core =
    { config, lib, ... }:
    let
      cfg = config.mySystem.monitoring.node-exporter;
    in
    {
      options.mySystem.monitoring.node-exporter = {
        enable = lib.mkEnableOption "Prometheus node exporter";
      };

      config = lib.mkIf (cfg.enable) {
        services.prometheus.exporters.node = {
          enable = true;
          enabledCollectors = [ "systemd" ];
          openFirewall = true;
        };
      };
    };
}
