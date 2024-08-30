{
  config = {
    ## Highlght on yank
    autoGroups.yankhighlight.clear = true;
    autoCmd = [
      {
        event = [ "TextYankPost" ];
        pattern = [ "*" ];
        group = "yankhighlight";
        callback = {
          __raw = "function()
            vim.highlight.on_yank()
          end";
        };
      }
    ];

    opts = {
      background = "dark";
      termguicolors = true;
      signcolumn = "yes";
      cursorcolumn = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavor = "mocha";
        integrations = {
          fzf = true;
          indent_blankline = {
            enabled = true;
            scope_color = "mauve";
          };
          nvim_surround = true;
          lsp_trouble = true;
        };
      };
    };
  };
}
