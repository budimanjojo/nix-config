{ myPkgs, ... }:
{
  config = {
    extraPlugins = [
      myPkgs.nvim-plugins.chezmoi-vim
    ];

    globals."chezmoi#use_tmp_buffer" = true;
  };
}
