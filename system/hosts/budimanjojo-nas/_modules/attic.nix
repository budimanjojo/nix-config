{ pkgs, config, ... }:
{
  sops.secrets.atticd-env-file = {
    sopsFile = ./secret.sops.yaml;
  };

  services.atticd = {
    enable = true;
    package = pkgs.unstable.attic-server;
    environmentFile = "${config.sops.secrets.atticd-env-file.path}";
    settings = {
      listen = "[::]:8080";
      garbage-collection.default-retention-period = "3 months";
      max-nar-info-size = 3145728; # 3 MiB
    };
  };

  networking.firewall.allowedTCPPorts = [ 8080 ];
}
