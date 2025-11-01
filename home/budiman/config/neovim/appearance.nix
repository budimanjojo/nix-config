{ pkgs, ... }:
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
            vim.hl.on_yank()
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
      package = pkgs.unstable.vimPlugins.catppuccin-nvim;
      settings = {
        flavor = "mocha";
        float.transparent = true;
        integrations = {
          snacks.enabled = true;
          indent_blankline = {
            enabled = true;
            scope_color = "mauve";
          };
          nvim_surround = true;
          lsp_trouble = true;
          noice = true;
          notify = true;
        };
      };
    };
  };
}
