{ inputs, ... }:
{
  nix = {
    # make `nix run nixpkgs#nixpkgs` use the same nixpkgs as the one used by this flake
    registry.nixpkgs.flake = inputs.nixpkgs;
    channel.enable = false; # remove nix-channel related tools & configs, we use flakes instead

    settings = {
      # NIX_PATH is still used by many useful tools, so we set it to the same value as the one used by this flake
      # make `nix repl '<nixpkgs>'` use the same nixpkgs as the one used by this flake
      nix-path = "nixpkgs=${inputs.nixpkgs.outPath}";
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://viperml.cachix.org" ];
      trusted-public-keys = [ "viperml.cachix.org-1:qZhKBMTfmcLL+OG6fj/hzsMEedgKvZVFRRAhq7j8Vh8=" ];
      auto-optimise-store = true;
      keep-outputs = true;
      keep-derivations = false;
    };
  };
}
