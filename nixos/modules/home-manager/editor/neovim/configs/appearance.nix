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

    highlightOverride = {
      ## Floating window border color
      FloatBorder.fg = "#C0CAF5";
    };

    opts = {
      background = "dark";
      termguicolors = true;
      signcolumn = "yes";
      cursorcolumn = true;
    };
    colorschemes.tokyonight = {
      enable = true;
      style = "night";
    };
  };
}
