{ fetchFromGitHub, pkgs, callPackage }:

let
  sourceData = callPackage ../_sources/generated.nix {};
in

{
  chezmoi-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.chezmoi-vim) pname src;
    version = sourceData.chezmoi-vim.date;
  };
  mason-lspconfig-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.mason-lspconfig-nvim) pname src;
    version = sourceData.mason-lspconfig-nvim.date;
  };
  mason-tool-installer-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.mason-tool-installer-nvim) pname src;
    version = sourceData.mason-tool-installer-nvim.date;
  };
  oil-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.oil-nvim) pname src;
    version = sourceData.mason-tool-installer-nvim.date;
  };
}
