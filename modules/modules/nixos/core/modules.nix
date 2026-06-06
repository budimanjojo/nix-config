{ inputs, ... }:
{
  flake.modules.nixos.core.imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.catppuccin.nixosModules.catppuccin
  ];
}
