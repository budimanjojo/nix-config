{ ... }:
{
  imports = [
    ./services/blocky
    ./services/qbittorrent

    ./firewall.nix
    ./network.nix
    ./wireguard.nix
  ];
}
