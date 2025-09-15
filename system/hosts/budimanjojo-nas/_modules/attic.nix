{ config, ... }:
{
  sops.secrets.atticd-env-file = {
    sopsFile = ./secret.sops.yaml;
  };

  services.atticd = {
    enable = true;
    environmentFile = "${config.sops.secrets.atticd-env-file.path}";
    settings = {
      listen = "[::]:8080";
      garbage-collection.default-retention-period = "3 months";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8080 ];
}
