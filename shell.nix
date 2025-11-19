{ pkgs, ... }:
with pkgs;
mkShell {
  buildInputs = [
    pkgs.just
  ];
}
