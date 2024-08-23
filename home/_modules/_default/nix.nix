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
    registry = {
      stable.flake = inputs.nixpkgs;
      unstable.flake = inputs.nixpkgs-unstable;
    };

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
      cores = 0;
      max-jobs = "auto";
    };
  };
}
