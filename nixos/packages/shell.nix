{ pkgs, ... }:
with pkgs;
mkShell {
  buildInputs = [
    nvfetcher
    nix-prefetch
    hydra-check
  ];
}
