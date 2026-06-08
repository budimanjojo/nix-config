{ inputs, ... }:
{
  flake.modules.homeManager.core = { pkgs, ... }: {
    imports = [
      inputs.sops-nix.homeManagerModules.sops
      inputs.catppuccin.homeModules.catppuccin
    ];
    # use whiskers package from nixpkgs so we don't need to build it
    catppuccin.sources = inputs.catppuccin.packages.${pkgs.stdenv.hostPlatform.system}.overrideScope (
      final: prev: { whiskers = pkgs.catppuccin-whiskers; }
    );
  };
}
