{ config, lib, ... }:
let
  cfg = config.mySystem.services.grafana;
  prometheusCfg = config.mySystem.services.prometheus;
in
{
  options.mySystem.services.grafana = {
    enable = lib.mkEnableOption "Grafana";
  };

  config = lib.mkIf (cfg.enable) {
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

        provision = lib.mkIf prometheusCfg.enable {
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

    networking.firewall.allowedTCPPorts = [ config.services.grafana.settings.server.http_port ];
  };
}
