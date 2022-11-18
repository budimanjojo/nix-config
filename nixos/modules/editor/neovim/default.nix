{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.editor.neovim;
  vimPlugins = pkgs.vimPlugins // config.nur.repos.m15a.vimExtraPlugins // pkgs.callPackage ./custom-plugins.nix {};
in {
  options.modules.editor.neovim = { enable = mkEnableOption "neovim"; };

  config = mkIf cfg.enable {
    home.manager = {
      xdg = {
        configFile."nvim/lua".source = ./lua;
        configFile."nvim/templates".source = ./templates;
        configFile."nvim/snippets".source = ./snippets;
        configFile."nvim/package.json".source = ./package.json;
      };
      home.packages = with pkgs; [
        curl
        gnutar
        fzf
        git
        go
        gzip
        sumneko-lua-language-server
        unzip
        wget
      ];
      programs.neovim = {
        enable = true;
        vimdiffAlias = true;
        withNodeJs = true;
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
          chezmoi-vim
          # Appearance
          tokyonight-nvim
          dressing-nvim
          nvim-web-devicons
          {
            plugin = lualine-nvim;
            config = "lua require('plugin-configs._lualine')";
          }
          {
            plugin = indent-blankline-nvim;
            config = "lua require('indent_blankline').setup()";
          }
          # LSP
          SchemaStore-nvim
          lsp_signature-nvim
          mason-nvim
          mason-lspconfig-nvim
          null-ls-nvim
          plenary-nvim
          mason-tool-installer-nvim
          {
            plugin = nvim-colorizer-lua;
            config = "lua require('colorizer').setup()";
          }
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
          # Enhancement
          {
            plugin = better-escape-nvim;
            config = "lua require('better_escape').setup { mapping = { 'ii' }}";
          }
          # System utility
          FTerm-nvim
          lir-git-status-nvim
          {
           plugin = vimPlugins.lir-nvim;
           config = "lua require('plugin-configs._lir')";
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
          # Braindead doctor
          {
            plugin = which-key-nvim;
            config = "lua require('which-key').setup()";
          }
          # Other
          presence-nvim
        ];
      };
    };
  };
}
