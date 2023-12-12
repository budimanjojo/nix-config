{ pkgs, lib, config, myPkgs,... }:
with lib;
let 
  cfg = config.hm-modules.editor.neovim;
  vimPlugins = pkgs.vimPlugins // myPkgs.nvim-plugins;
in {
  options.hm-modules.editor.neovim = { enable = mkEnableOption "neovim"; };

  config = mkIf cfg.enable {
    xdg = {
      configFile."nvim/lua".source = ./lua;
      configFile."nvim/snippets".source = ./snippets;
    };
    programs.go.enable = true;
    home.packages = with pkgs; [
      ansible-lint
      clang-tools
      curl
      delta
      gnutar
      fd
      fzf
      git
      gzip
      nil
      sad
      sumneko-lua-language-server
      unzip
      wget
    ];
    programs.neovim = {
      enable = true;
      vimdiffAlias = true;
      withNodeJs = true;
      extraLuaPackages = luaPkgs: with luaPkgs; [jsregexp];
      extraPackages = [
      ];
      extraConfig = ''
        lua require('general')
        lua require('appearance')
        lua require('keymaps')
        lua require('autocmds')
      '';
      plugins = with vimPlugins; [
        # Syntax highlighting
        ansible-vim
        {
          plugin = nvim-colorizer-lua;
          config = "lua require('colorizer').setup()";
        }
        chezmoi-vim
        # Appearance
        tokyonight-nvim
        dressing-nvim
        guihua-lua
        nvim-web-devicons
        {
          plugin = lualine-nvim;
          config = "lua require('plugin-configs._lualine')";
        }
        {
          plugin = indent-blankline-nvim;
          config = "lua require('ibl').setup()";
        }
        # LSP
        SchemaStore-nvim
        lsp_signature-nvim
        mason-nvim
        mason-lspconfig-nvim
        neodev-nvim
        null-ls-nvim
        plenary-nvim
        mason-tool-installer-nvim
        {
         plugin = nvim-lspconfig;
         config = "lua require('plugin-configs._lspconfig')";
        }
        {
          plugin = nvim-treesitter.withPlugins (plugins: with plugins; [
            tree-sitter-bash
            tree-sitter-comment
            tree-sitter-dockerfile
            tree-sitter-fish
            tree-sitter-go
            tree-sitter-html
            tree-sitter-json
            tree-sitter-json5
            tree-sitter-lua
            tree-sitter-nix
            tree-sitter-python
            tree-sitter-regex
            tree-sitter-typescript
            tree-sitter-vim
            tree-sitter-yaml
          ]);
          config = "lua require('plugin-configs._treesitter')";
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
        #
        trouble-nvim
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
          plugin = hop-nvim;
          config = "lua require('hop').setup()";
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
        #nur.repos.m15a.vimExtraPlugins.b64-nvim
        # Other
        presence-nvim
      ];
    };
  };
}
