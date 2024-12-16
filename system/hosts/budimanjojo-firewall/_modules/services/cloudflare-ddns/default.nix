{ config, ... }:
{
  sops.secrets."cloudflare-ddns/env" = {
    sopsFile = ./secret.sops.yaml;
  };
  virtualisation.oci-containers.containers.cloudflare-ddns = {
    image = "docker.io/favonia/cloudflare-ddns:1.15.1";
    extraOptions = [ "--network=host" ];
    environment = {
      IP6_PROVIDER = "none";
      UPDATE_CRON = "@every 2m";
      PROXIED = "true";
    };
    environmentFiles = [ "${config.sops.secrets."cloudflare-ddns/env".path}" ];
  };
}
