{ inputs, ... }:
{
  flake.modules.nixos.core = { pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
      inputs.catppuccin.nixosModules.catppuccin
    ];
    catppuccin.sources = inputs.catppuccin.packages.${pkgs.stdenv.hostPlatform.system}.overrideScope (
      final: prev: { whiskers = pkgs.catppuccin-whiskers; }
    );
  };
}
