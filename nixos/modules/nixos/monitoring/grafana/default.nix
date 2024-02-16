{ lib, config, ... }:
with lib;
let 
  cfg = config.modules.monitoring.grafana;
in {
  options.modules.monitoring.grafana = { enable = mkEnableOption "grafana"; };

  config = mkIf cfg.enable {
    sops.secrets.grafana-password = {
      sopsFile = ./secret.sops.yaml;
      owner = config.users.users.grafana.name;
    };
    services = {
      grafana = {
        enable = true;

        settings = {
          security = {
            admin_password = "$__file{${config.sops.secrets.grafana-password.path}}";
          };
          server = {
            http_addr = "0.0.0.0";
          };
        };

        provision = mkIf config.modules.monitoring.prometheus.enable {
          enable = true;
          datasources.settings.datasources = [
            {
              name = "Prometheus";
              type = "prometheus";
              url = "http://localhost:${toString config.services.prometheus.port}";
              isDefault = true;
            }
          ];
        };
      };
    };

    networking.firewall.allowedTCPPorts = [
      config.services.grafana.settings.server.http_port
    ];
  };
}
