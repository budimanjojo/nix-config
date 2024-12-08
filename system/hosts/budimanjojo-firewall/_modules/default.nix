{ ... }:
{
  imports = [
    ./firewall

    ./services/adguardhome
    ./services/bind
    ./services/chrony
    ./services/cloudflare-ddns
    ./services/fireqos
    ./services/frr
    ./services/kea
    ./services/omada-controller
    ./services/rsyslogd

    ./network.nix
    ./podman.nix
    ./wireguard.nix
  ];
}
