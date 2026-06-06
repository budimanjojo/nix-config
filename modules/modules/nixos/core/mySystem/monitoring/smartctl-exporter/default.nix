{
  flake.modules.nixos.core =
    { config, lib, ... }:
    let
      cfg = config.mySystem.monitoring.smartctl-exporter;
    in
    {
      options.mySystem.monitoring.smartctl-exporter = {
        enable = lib.mkEnableOption "Prometheus smartctl exporter";
      };

      config = lib.mkIf (cfg.enable) {
        services.prometheus.exporters.smartctl = {
          enable = true;
          openFirewall = true;
        };
      };
    };
}
