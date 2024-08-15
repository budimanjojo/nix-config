{
  lib,
  osConfig,
  pkgs,
  inputs,
  ...
}:
let
  isNixos = lib.myLib.isNixos osConfig;
in
{
  # only enable when we are not on NixOS
  nix = lib.mkIf (!isNixos) {
    package = pkgs.nix;
    registry.nixpkgs.flake = inputs.nixpkgs;

    gc.automatic = true;

    settings = {
      nix-path = "nixpkgs=${inputs.nixpkgs.outPath}";
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      keep-outputs = true;
      keep-derivations = false;
    };
  };
}
