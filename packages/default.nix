{
  pkgs,
  inputs',
  self',
  ...
}:
{
  talhelper = inputs'.talhelper.packages.default;
  configure-gtk = pkgs.callPackage ./configure-gtk/default.nix { };
  tokyonight-gtk-theme = pkgs.callPackage ./tokyonight-gtk-theme/default.nix { };
  tokyonight-icon-theme = pkgs.callPackage ./tokyonight-icon-theme/default.nix { };
  nvim-plugins = pkgs.callPackage ./nvim-plugins/default.nix { };
  fish-plugins = pkgs.fishPlugins.callPackage ./fish-plugins/default.nix { };
  krr = pkgs.callPackage ./krr/default.nix { };
  kubectl-rook-ceph = pkgs.callPackage ./kubectl-rook-ceph/default.nix { };
  neovim = inputs'.nixvim.legacyPackages.makeNixvimWithModule {
    # make nixvim use the same pkgs with my overlays added
    inherit pkgs;
    extraSpecialArgs = {
      myPkgs = self'.legacyPackages;
    };
    module.imports = [ ../home/budiman/config/neovim ];
  };
}
