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
    version = sourceData.oil-nvim.date;
  };
  luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.luasnip) pname src version;
  };
  sad-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.sad-nvim) pname src;
    version = sourceData.sad-nvim.date;
  };
  k8s-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.k8s-snippets) pname src;
    version = sourceData.k8s-snippets.date;
  };
  guihua-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    inherit (sourceData.guihua-lua) pname src;
    version = sourceData.guihua-lua.date;
    buildPhase = ''
      (
        cd lua/fzy
        make
      )
    '';
  };
}
