{ pkgs, myPkgs, ... }:
let
  vimPlugins = pkgs.vimPlugins // myPkgs.nvim-plugins;
in
{
  config = {
    plugins = {
      nvim-colorizer.enable = true;
      treesitter = {
        enable = true;
        indent = false;
        nixvimInjections = true;
      };
    };
    extraPlugins = with vimPlugins; [
      chezmoi-vim
      vimPlugins.ansible-vim
    ];
  };
}
