{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.monitoring.prometheus;
in {
  options.modules.monitoring.prometheus = { enable = mkEnableOption "prometheus"; };

  config = mkIf cfg.enable {
    sops.secrets.alertmanager-secret = {};
    services = {
      prometheus = {
        enable = true;

        ruleFiles = [
          ./rules/embedded-exporter.yaml
          ./rules/node-exporter.yaml
        ];

        exporters = {
          node = {
            enable = true;
            enabledCollectors = [ "systemd" ];
          };
        };

        alertmanager = {
          enable = true;
          environmentFile = config.sops.secrets.alertmanager-secret.path;
          configuration = {
            global = {
              resolve_timeout = "5m";
            };
            receivers = [
              {
                name = "discord";
                discord_configs = [
                  {
                    webhook_url = "https://discord.com/api/webhooks/$DISCORD_WEBHOOK_KEY";
                    title = ''
                      [{{ .Status | toUpper }}:{{ if eq .Status "firing" }}{{ .Alerts.Firing | len }}{{ else }}{{ .Alerts.Resolved | len }}{{ end }}]
                    '';
                    message = ''
                      {{- range .Alerts }}
                        **{{ .Labels.alertname }} {{ if ne .Labels.severity "" }}({{ .Labels.severity | title }}){{ end }} **
                        {{- if ne .Annotations.description "" }}
                         **Description:** {{ .Annotations.description }}
                        {{- else if ne .Annotations.summary "" }}
                         **Summary:** {{ .Annotations.summary }}
                        {{- else if ne .Annotations.message "" }}
                         **Message:** {{ .Annotations.message }}
                        {{- else }}
                         **Description:** N/A
                        {{- end }}
                      {{- end }}
                    '';
                  }
                ];
              }
            ];
            route = {
              group_by = [ "alertname" ];
              group_interval = "5m";
              group_wait = "30s";
              receiver = "discord";
              repeat_interval = "12h";
            };
          };
        };

        alertmanagers = [
          {
            static_configs = [{
              targets = [ "localhost:${toString config.services.prometheus.alertmanager.port}" ];
            }];
          }
        ];

        scrapeConfigs = [
          {
            job_name = "prometheus";
            static_configs = [{
              targets = [ "localhost:${toString config.services.prometheus.port}" ];
            }];
          }
          {
            job_name = "node";
            static_configs = [{
              targets = [ "localhost:${toString config.services.prometheus.exporters.node.port}" ];
            }];
          }
        ];
      };
    };

    networking.firewall.allowedTCPPorts = [
      config.services.prometheus.port
      config.services.prometheus.exporters.node.port
      config.services.prometheus.alertmanager.port
    ];
  };
}
