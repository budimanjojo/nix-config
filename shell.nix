{ inputs', pkgs, ... }:
with pkgs;
mkShell {
  buildInputs = [
    inputs'.nvfetcher.packages.default
    nix-prefetch
    hydra-check
  ];
}
