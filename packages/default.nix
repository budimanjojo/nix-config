{
  self,
  inputs,
  pkgs,
  inputs',
  ...
}:
let
  sourceData = pkgs.callPackage ./_sources/generated.nix { };
in
{
  # this is for cache-nix-action so stuffs don't get garbage collected
  # before I cache the nix-store, mostly to not redownload inputs a lot
  gc-keep =
    (import "${inputs.cache-nix-action}/saveFromGC.nix" {
      inherit pkgs inputs;
      inputsInclude = [
        "nixpkgs"
        "nixpkgs-unstable"
        "flake-parts"
        "home-manager"
        "sops-nix"
        "disko"
        "nur"
        "nvfetcher"
        "nixvim"
        "talhelper"
        "catppuccin"
        "nixgl"
      ];
    }).package;
  talhelper = inputs'.talhelper.packages.default;
  configure-gtk = pkgs.callPackage ./configure-gtk/default.nix { };
  tokyonight-icon-theme = pkgs.callPackage ./tokyonight-icon-theme/default.nix { };
  chezmoi-vim = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.chezmoi-vim) pname src;
    version = sourceData.chezmoi-vim.date;
  };
  k8s-snippets = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.k8s-snippets) pname src;
    version = sourceData.k8s-snippets.date;
  };
  neovim = inputs'.nixvim.legacyPackages.makeNixvimWithModule {
    # make nixvim use the same pkgs with my overlays added
    inherit pkgs;
    module.imports = [ self.modules.generic.nixvim ];
  };
}
