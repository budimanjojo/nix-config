{ pkgs, myPkgs, ... }:
let
  vimPlugins = pkgs.vimPlugins // myPkgs.nvim-plugins;
in
{
  config = {
    extraPlugins = with vimPlugins; [
      friendly-snippets
      k8s-snippets
    ];
    extraConfigLuaPre = ''
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require('luasnip')
    '';
    plugins = {
      ts-autotag.enable = true;
      luasnip = {
        enable = true;
        fromLua = [
          { paths = ../snippets; }
        ];
        fromVscode = [{}];
        extraConfig = {
          __raw = ''
            {
              ext_opts = {
                [require('luasnip.util.types').choiceNode] = {
                  active = {
                    virt_text = {{ "●", "DiagnosticVirtualTextWarn" }}
                  }
                },
                [require('luasnip.util.types').insertNode] = {
                  active = {
                    virt_text = {{ "●", "DiagnosticVirtualTextInfo" }}
                  }
                }
              }
            }
          '';
        };
      };
      lspkind = {
        enable = true;
        extraOptions = {
          with_text = true;
        };
        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            luasnip = "[LuaSnip]";
            nvim_lua = "[Lua]";
            buffer = "[Buffer]";
            path = "[Path]";
            spell = "[Spell]";
          };
        };
      };
      nvim-cmp = {
        enable = true;
        completion.completeopt = "menu,menuone,noselect";
        snippet.expand = "luasnip";
        mapping = {
          "<C-j>" = {
            action = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.choice_active() then
                  luasnip.change_choice(1)
                elseif has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end
            '';
            modes = [ "i" "s" ];
          };
          "<C-k>" = {
            action = ''
              function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.choice_active() then
                luasnip.change_choice(-1)
              else
                fallback()
              end
            end
            '';
            modes = [ "i" "s" ];
          };
          "<C-l>" = {
            action = ''
              function(fallback)
              if luasnip.expand_or_locally_jumpable() then
                luasnip.jump(1)
              else
                fallback()
              end
            end
            '';
            modes = [ "i" "s" ];
          };
          "<C-h>" = {
            action = ''
              function(fallback)
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end
            '';
            modes = [ "i" "s" ];
          };
          "<C-Space>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace })";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace })";
          "<BS>" = {
            action = ''
              function(fallback)
              if luasnip.in_snippet() then
                fallback()
                vim.api.nvim_input('i')
              else
                fallback()
              end
            end
            '';
            modes = [ "s" ];
          };
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "spell"; }
        ];
      };
    };
  };
}
