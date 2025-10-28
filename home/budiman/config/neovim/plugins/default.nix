{
  imports = [
    ./blink-cmp
    ./chezmoi-vim
    ./cord
    ./endec
    ./gitsigns
    ./lualine
    ./grug-far
    ./luasnip
    ./mini
    ./none-ls
    ./nvim-autopairs
    ./oil
    ./snacks
    ./toggleterm
    ./treesitter
  ];

  config.plugins = {
    web-devicons.enable = true;
    colorizer.enable = true;
    ts-autotag.enable = true;
  };
}
