{ pkgs, myPkgs, ... }:
{
  config = {
    extraPlugins = [
      pkgs.vimPlugins.lsp_signature-nvim
      pkgs.vimPlugins.SchemaStore-nvim
      pkgs.vimPlugins.neodev-nvim
    ];
    plugins = {
      trouble.enable = true;
      ## clangd requires extra care
      clangd-extensions = {
        enable = true;
        enableOffsetEncodingWorkaround = true;
      };
      lsp = {
        enable = true;
        preConfig = ''
          -- Diagnostic looks
          vim.diagnostic.config {
            virtual_text = false,
            update_in_insert = true,
            float = {
              source = 'if_many'
            }
          }

          --Signcolumn symbols
          local signs = { Error = '󰅚 ', Warn = '󰗖 ', Hint = '󰌶 ', Info = ' ' }
          for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
          end

          -- Show diagnostics on hover
          vim.o.updatetime = 150
          vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])

          -- Use neodev for lua
          require('neodev').setup()
        '';
        capabilities = ''
          capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          capabilities.textDocument.completion.completionItem.preselectSupport = true
          capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
          capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
          capabilities.textDocument.completion.completionItem.deprecatedSupport = true
          capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
          capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
          capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
              'documentation',
              'detail',
              'additionalTextEdits',
            },
          }
        '';
        onAttach = ''
          require 'lsp_signature'.on_attach()
          local keymap = vim.keymap
          local opts = { buffer = bufnr }

          keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { unpack(opts), desc = "Do LSP rename action" })
          keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { unpack(opts), desc = "Do LSP code action" })
          keymap.set('n', 'gd', vim.lsp.buf.definition, { unpack(opts), desc = "Do LSP get definition action" })
          keymap.set('n', 'gD', vim.lsp.buf.declaration, { unpack(opts), desc = "Do LSP get definition action" })
          keymap.set('n', 'gh', function() return require('utils').fix_buf_hover() end, { unpack(opts), desc = "Do LSP hover action" })
          keymap.set('n', 'gr', vim.lsp.buf.references, { unpack(opts), desc = "Do LSP get references action" })
          keymap.set('n', 'gi', vim.lsp.buf.implementation, { unpack(opts), desc = "Do LSP get implementation action" })
        '';
        servers = {
          ansiblels.enable = true; # # ansiblels
          bashls.enable = true; # # bashls
          cssls.enable = true; # # cssls
          dockerls.enable = true; # # dockerls

          ## gopls
          gopls = {
            enable = true;
            # TODO: https://github.com/NixOS/nixpkgs/issues/293180
            package = myPkgs.gopls;
            extraOptions = {
              settings = {
                gopls = {
                  gofumpt = true;
                };
              };
            };
          };

          taplo.enable = true; # # taplo
          tsserver.enable = true; # # tsserver

          ## jsonls
          jsonls = {
            enable = true;
            filetypes = [
              "json"
              "jsonc"
              "json5"
            ];
            extraOptions = {
              settings = {
                json = {
                  schemas.__raw = "require('schemastore').json.schemas()";
                };
              };
            };
          };

          nil-ls.enable = true; # # nil
          pyright.enable = true; # # pyright
          lua-ls.enable = true; # # lua-language-server

          ## yamlls
          yamlls = {
            enable = true;
            extraOptions = {
              settings.yaml = {
                customTags = [
                  "!include_dir_list"
                  "!include_dir_named"
                  "!include_dir_merge_list"
                  "!include_dir_merge_named"
                  "!secret"
                  "!env_var"
                ];
                schemas = {
                  kubernetes = [
                    "namespace.yaml"
                    "deployment.yaml"
                    "daemonset.yaml"
                    "statefulset.yaml"
                    "service.yaml"
                    "pv.yaml"
                    "pvc.yaml"
                    "configmmap.yaml"
                    "secret.yaml"
                    "rbac.yaml"
                    "crd.yaml"
                    "storageclass.yaml"
                    "cronjob.yaml"
                  ];
                  "https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json" = [
                    "docker-compose.yml"
                    "docker-compose.yaml"
                  ];
                  "https://json.schemastore.org/github-workflow" = [
                    ".github/workflows/**.yml"
                    ".github/workflows/**.yaml"
                  ];
                  "https://json.schemastore.org/github-actions" = [
                    "action.yml"
                    "action.yaml"
                  ];
                  "https://json.schemastore.org/gitlab-ci" = ".gitlab-ci.yml";
                  "https://json.schemastore.org/kustomization" = [
                    "kustomization.yml"
                    "kustomization.yaml"
                  ];
                  "https://json.schemastore.org/pre-commit-config" = [
                    ".pre-commit-config.yml"
                    ".pre-commit-config.yaml"
                  ];
                };
              };
            };
          };
        };
      };

      none-ls = {
        enable = true;
        diagnosticsFormat = "[#{c}] #{m} (#{s})";
        sources = {
          formatting = {
            nixfmt = {
              enable = true;
              package = pkgs.nixfmt-rfc-style;
            };
            prettier = {
              enable = true;
              disableTsServerFormatter = true;
            };
            shfmt = {
              enable = true;
              withArgs = "{ extra_args = { '-i', '2', '-ci' } }";
            };
          };
          diagnostics = {
            ansiblelint = {
              enable = true;
              withArgs = "{ filetypes = { 'yaml.ansible' } }";
            };
            golangci_lint.enable = true;
            markdownlint.enable = true;
            write_good.enable = true;
            yamllint.enable = true;
          };
        };
      };
    };
  };
}
