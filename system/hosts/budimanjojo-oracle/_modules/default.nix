{ ... }:
{
  imports = [
    ./services/blocky

    ./firewall.nix
    ./network.nix
    ./wireguard.nix
  ];
}
