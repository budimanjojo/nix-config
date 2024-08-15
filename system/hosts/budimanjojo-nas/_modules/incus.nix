{ config, pkgs, ... }:
let
  runner = "${config.virtualisation.incus.package}/bin/incus";

  oidcSetup = pkgs.writeShellScript "oidcSetup" ''
    DOMAIN=$(${pkgs.coreutils}/bin/cat ${config.sops.secrets.secret-domain-0.path})

    ${runner} config set oidc.client.id incus
    ${runner} config set oidc.audience https://incus."$DOMAIN"
    ${runner} config set oidc.issuer https://auth."$DOMAIN"
  '';
in
{
  sops.secrets.secret-domain-0 = {
    sopsFile = ./secret.sops.yaml;
  };

  virtualisation.incus = {
    enable = true;
    ui.enable = true;
    preseed = {
      config = {
        "core.https_address" = "[::]:8443";
      };
      networks = [
        {
          name = "incusbr0";
          type = "bridge";
          config = {
            "ipv4.address" = "10.0.100.1/24";
            "ipv4.nat" = true;
            "ipv6.address" = "auto";
          };
        }
      ];
      storage_pools = [
        {
          config.source = "/vm-data";
          driver = "btrfs";
          name = "default";
        }
      ];
      profiles = [
        {
          name = "default";
          devices = {
            eth0 = {
              name = "eth0";
              type = "nic";
              network = "incusbr0";
            };
            root = {
              path = "/";
              pool = "default";
              size = "20GB";
              type = "disk";
            };
          };
        }
        {
          name = "external";
          devices = {
            eth1 = {
              name = "eth1";
              type = "nic";
              nictype = "bridged";
              parent = "br0";
            };
            root = {
              path = "/";
              pool = "default";
              size = "20GB";
              type = "disk";
            };
          };
        }
      ];
    };
  };

  users.users.${config.mySystem.adminUser}.extraGroups = [ "incus-admin" ];

  systemd.services.incus-preseed.postStart = "${oidcSetup}";

  networking = {
    nftables.enable = true;
    firewall = {
      allowedTCPPorts = [
        8443
        53
        67
      ];
      allowedUDPPorts = [
        53
        67
      ];
    };
  };
}
