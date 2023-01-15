{ pkgs, ... }:
with pkgs;
mkShell {
  buildInputs = [
    nvfetcher
  ];
}
