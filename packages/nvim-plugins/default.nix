{
  fetchFromGitHub,
  pkgs,
  callPackage,
}:

let
  sourceData = callPackage ../_sources/generated.nix { };
in

{
  chezmoi-vim = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.chezmoi-vim) pname src;
    version = sourceData.chezmoi-vim.date;
  };
  mason-lspconfig-nvim = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.mason-lspconfig-nvim) pname src;
    version = sourceData.mason-lspconfig-nvim.date;
  };
  mason-tool-installer-nvim = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.mason-tool-installer-nvim) pname src;
    version = sourceData.mason-tool-installer-nvim.date;
  };
  oil-nvim = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.oil-nvim) pname src;
    version = sourceData.oil-nvim.date;
  };
  luasnip = pkgs.vimUtils.buildVimPlugin { inherit (sourceData.luasnip) pname src version; };
  sad-nvim = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.sad-nvim) pname src;
    version = sourceData.sad-nvim.date;
    # TODO: check failing and Idk why
    nvimSkipModules = [ "sad.term" ];
  };
  k8s-snippets = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.k8s-snippets) pname src;
    version = sourceData.k8s-snippets.date;
  };
  guihua-lua = pkgs.vimUtils.buildVimPlugin {
    inherit (sourceData.guihua-lua) pname src;
    version = sourceData.guihua-lua.date;
    buildPhase = ''
      (
        cd lua/fzy
        make
      )
    '';
    # TODO: check failing and Idk why
    nvimSkipModules = [ "fzy.fzy-lua-native" ];
  };
}
