{ pkgs, myPkgs, ... }:
let
  vimPlugins = pkgs.vimPlugins // myPkgs.nvim-plugins;
in
{
  ## I prefer writing plugin configs using lua because
  ## a) not everything can be configured with the provided nixvim modules
  ## b) I don't want to wait for upstream to merge my PR which takes forever
  ## c) LSP and syntax highlighting will work without any effort

  ## But, to configure LSP, it's easier to make use of nixvim provided module so I use that
  # imports = [ ./lsp.nix ];
  config = {
    extraFiles = {
      ## These are raw lua files of plugin configs so I can require them in the plugin set
    };

    ## dependencies needed for plugins
    extraPackages = with pkgs; [
      gzip
      shellcheck
    ];

    extraPlugins = with vimPlugins; [
      # Syntax highlighting
      ansible-vim
      chezmoi-vim
      # guihua-lua
      # System utility
      FTerm-nvim
      # Editing support
      {
        plugin = nvim-surround;
        config = "lua require('nvim-surround').setup()";
      }
      {
        plugin = trim-nvim;
        config = "lua require('trim').setup()";
      }
      b64-nvim
      # Other
      presence-nvim
    ];
  };
}
