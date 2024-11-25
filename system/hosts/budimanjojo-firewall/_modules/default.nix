{ ... }:
{
  imports = [
    ./firewall/default.nix

    ./services/adguardhome/default.nix
    ./services/bind/default.nix
    ./services/chrony/default.nix
    ./services/cloudflare-ddns/default.nix
    ./services/frr/default.nix
    ./services/omada-controller/default.nix

    ./network.nix
    ./podman.nix
  ];
}
