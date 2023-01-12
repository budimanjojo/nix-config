{ fetchFromGitHub, pkgs, callPackage }:

let
  sourceData = callPackage ../_sources/generated.nix {};
in

{
  chezmoi-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.chezmoi-vim) pname version src;
  };
  mason-lspconfig-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.mason-lspconfig-nvim) pname version src;
  };
  mason-tool-installer-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.mason-tool-installer-nvim) pname version src;
  };
  oil-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.oil-nvim) pname version src;
  };
}
