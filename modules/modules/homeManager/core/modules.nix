{ inputs, ... }:
{
  flake.modules.homeManager.core.imports = [
    inputs.sops-nix.homeManagerModules.sops
    inputs.catppuccin.homeModules.catppuccin
  ];
}
