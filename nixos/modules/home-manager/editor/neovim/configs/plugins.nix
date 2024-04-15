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
  imports = [
    ./lsp.nix
  ];
  config = {
    ## load the lua snippets from nix store
    extraConfigLua = "require('luasnip.loaders.from_lua').lazy_load({paths = '${./snippets}'})";

    extraFiles = {
      ## These are raw lua files of plugin configs so I can require them in the plugin set
      "lua/plugin-configs/_autopairs.lua" = builtins.readFile ./lua/plugin-configs/_autopairs.lua;
      "lua/plugin-configs/_fzf-lua.lua" = builtins.readFile ./lua/plugin-configs/_fzf-lua.lua;
      "lua/plugin-configs/_gitsigns.lua" = builtins.readFile ./lua/plugin-configs/_gitsigns.lua;
      "lua/plugin-configs/_lualine.lua" = builtins.readFile ./lua/plugin-configs/_lualine.lua;
      "lua/plugin-configs/_nvim-cmp.lua" = builtins.readFile ./lua/plugin-configs/_nvim-cmp.lua;
      "lua/plugin-configs/_oil.lua" = builtins.readFile ./lua/plugin-configs/_oil.lua;
      "lua/plugin-configs/_sad-nvim.lua" = builtins.readFile ./lua/plugin-configs/_sad-nvim.lua;
      "lua/plugin-configs/_treesitter.lua" = builtins.readFile ./lua/plugin-configs/_treesitter.lua;
      "lua/plugin-configs/_indent-blankline.lua" = builtins.readFile ./lua/plugin-configs/_indent-blankline.lua;

      ## lua highlighting in extraConfigLua
      "queries/nix/injections.scm" = ''
        ;; extends

        (binding
          attrpath: (attrpath (identifier) @_path)
          expression: [
            (string_expression (string_fragment) @lua)
            (indented_string_expression (string_fragment) @lua)
          ]
          (#match? @_path "^extraConfigLua(Pre|Post)?$"))

        (binding
          attrpath: (attrpath (identifier) @_path)
          expression: [
            (string_expression (string_fragment) @vim)
            (indented_string_expression (string_fragment) @vim)
          ]
          (#match? @_path "^extraConfigVim(Pre|Post)?$"))
      '';
    };

    ## dependencies needed for plugins
    extraPackages = with pkgs; [
      fd
      fzf
      ripgrep
      git
      gzip
      sad
      shellcheck
    ];

    extraPlugins = with vimPlugins; [
      # Syntax highlighting
      ansible-vim
      {
        plugin = nvim-colorizer-lua;
        config = "lua require('colorizer').setup()";
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = "lua require('plugin-configs._treesitter')";
      }
      chezmoi-vim
      # Appearance
      dressing-nvim
      guihua-lua
      nvim-web-devicons
      {
        plugin = lualine-nvim;
        config = "lua require('plugin-configs._lualine')";
      }
      {
        plugin = indent-blankline-nvim;
        config = "lua require('plugin-configs._indent-blankline')";
      }
      # Autocompletion
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-spell
      cmp_luasnip
      lspkind-nvim
      luasnip
      friendly-snippets
      k8s-snippets
      {
        plugin = nvim-cmp;
        config = "lua require('plugin-configs._nvim-cmp')";
      }
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
        plugin = sad-nvim;
        config = "lua require('plugin-configs._sad-nvim')";
      }
      # System utility
      FTerm-nvim
      {
       plugin = oil-nvim;
       config = "lua require('plugin-configs._oil')";
      }
      {
        plugin = gitsigns-nvim;
        config = "lua require('plugin-configs._gitsigns')";
      }
      # Editing support
      {
        plugin = comment-nvim;
        config = "lua require('Comment').setup()";
      }
      {
        plugin = nvim-autopairs;
        config = "lua require('plugin-configs._autopairs')";
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
