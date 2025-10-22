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
      "lua/plugin-configs/_fzf-lua.lua".source = ./lua/plugin-configs/_fzf-lua.lua;
      "lua/plugin-configs/_grug-far.lua".source = ./lua/plugin-configs/_grug-far.lua;
      "lua/plugin-configs/_indent-blankline.lua".source = ./lua/plugin-configs/_indent-blankline.lua;
    };

    ## dependencies needed for plugins
    extraPackages = with pkgs; [
      fd
      fzf
      ripgrep
      git
      gzip
      shellcheck
    ];

    extraPlugins = with vimPlugins; [
      # Syntax highlighting
      ansible-vim
      {
        plugin = nvim-colorizer-lua;
        config = "lua require('colorizer').setup()";
      }
      chezmoi-vim
      # Appearance
      dressing-nvim
      # guihua-lua
      {
        plugin = indent-blankline-nvim;
        config = "lua require('plugin-configs._indent-blankline')";
      }
      # Autocompletion
      lspkind-nvim
      {
        plugin = nvim-ts-autotag;
        config = "lua require('nvim-ts-autotag').setup()";
      }
      # Fuzzy finder
      {
        plugin = fzf-lua;
        config = "lua require('plugin-configs._fzf-lua')";
      }
      {
        # TODO: stable package fails to build
        plugin = pkgs.unstable.vimPlugins.grug-far-nvim;
        config = "lua require('plugin-configs._grug-far')";
      }
      # System utility
      FTerm-nvim
      # Editing support
      {
        plugin = comment-nvim;
        config = "lua require('Comment').setup()";
      }
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
