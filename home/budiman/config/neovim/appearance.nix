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
      };
    };
  };
}
