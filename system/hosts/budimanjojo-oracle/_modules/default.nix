{ ... }:
{
  imports = [
    ./services/blocky

    ./network.nix
    ./wireguard.nix
  ];
}
