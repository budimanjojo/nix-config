{ inputs, hostname, ... }:
{
  nix = {
    # make `nix run` and `nix shell` use the same nixpkgs as the one used by this flake
    # for example, to run `talosctl` from the `unstable` branch, we can run `nix shell unstable#talosctl`
    registry = {
      stable.flake = inputs.nixpkgs;
      unstable.flake = inputs.nixpkgs-unstable;
    };
    channel.enable = false; # remove nix-channel related tools & configs, we use flakes instead

    settings = {
      # NIX_PATH is still used by many useful tools, so we set it to the same value as the one used by this flake
      # make `nix repl '<nixpkgs>'` use the same nixpkgs as the one used by this flake
      nix-path = "nixpkgs=${inputs.nixpkgs.outPath}";
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://viperml.cachix.org"
        "https://budimanjojo.cachix.org"
      ];
      trusted-public-keys = [
        "viperml.cachix.org-1:qZhKBMTfmcLL+OG6fj/hzsMEedgKvZVFRRAhq7j8Vh8="
        "budimanjojo.cachix.org-1:S0gy6IKTFXis9fFqEbVAS2zsvnZw/30NV2bWvGiN1YQ="
      ];
      auto-optimise-store = true;
      keep-outputs = true;
      keep-derivations = false;
      # this make sure we always check for new commit when fetching source
      tarball-ttl = 0;
    };
  };
}
