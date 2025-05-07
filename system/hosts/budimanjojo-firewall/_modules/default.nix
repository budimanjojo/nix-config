{ ... }:
{
  imports = [
    ./firewall

    ./services/adguardhome
    ./services/chrony
    ./services/fireqos
    ./services/frr
    ./services/kea
    ./services/omada-controller
    ./services/powerdns
    ./services/rsyslogd

    ./network.nix
    ./podman.nix
    ./wireguard.nix
  ];
}
