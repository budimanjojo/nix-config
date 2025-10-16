{
  pkgs,
  myPkgs,
  lib,
  ...
}:
let
  vimPlugins = pkgs.vimPlugins // myPkgs.nvim-plugins;
in
{
  config = {
    extraPlugins = with vimPlugins; [
      friendly-snippets
      k8s-snippets
    ];

    plugins.luasnip = {
      enable = true;
      fromLua = [ { paths = ./lua-snippets; } ];
      fromVscode = [ { exclude = [ "gitcommit" ]; } ];

      # Hint snippet node-type with virtual text
      # https://github.com/L3MON4D3/LuaSnip/wiki/Nice-Configs#hint-node-type-with-virtual-text
      settings.ext_opts = lib.nixvim.toRawKeys {
        "require('luasnip.util.types').choiceNode".active.virt_text = [
          [
            "● "
            "DiagnosticVirtualTextWarn"
          ]
        ];
        "require('luasnip.util.types').insertNode".active.virt_text = [
          [
            "● "
            "DiagnosticVirtualTextInfo"
          ]
        ];
      };
    };

    keymaps = [
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-j>";
        action.__raw = ''
          function()
            if require('luasnip').choice_active() then
              require('luasnip').change_choice(1)
            else
              vim.api.nvim_input("<Down>")
            end
          end'';
        options.desc = "Select choice node in snippet or move cursor down";
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-k>";
        action.__raw = ''
          function()
            if require('luasnip').choice_active() then
              require('luasnip').change_choice(-1)
            else
              vim.api.nvim_input("<Up>")
            end
          end'';
        options.desc = "Select choice node in snippet or move cursor up";
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-l>";
        action.__raw = ''
          function()
            if require('luasnip').expand_or_locally_jumpable() then
              require('luasnip').jump(1)
            else
              vim.api.nvim_feedkeys(vim.keycode("<Right>"), "i", false)
            end
          end'';
        options.desc = "Go to next snippet or move cursor right";
      }
      {
        mode = [
          "i"
          "s"
        ];
        key = "<C-h>";
        action.__raw = ''
          function()
            if require('luasnip').locally_jumpable() then
              require('luasnip').jump(-1)
            else
              vim.api.nvim_feedkeys(vim.keycode("<Left>"), "i", false)
            end
          end'';
        options.desc = "Go to next snippet or move cursor left";
      }
    ];

    # ChoiceNode popup in snippet
    autoGroups.choicepopup.clear = true;
    autoCmd = [
      {
        even = [ "User" ];
        pattern = [
          "LuasnipChoiceNodeEnter"
          "LuasnipChoiceNodeLeave"
          "LuasnipChangeChoice"
        ];
        group = "choicepopup";
        callback.__raw = ''
          function(arg)
            local match = arg.match
            if match == 'LuasnipChoiceNodeEnter' then
              require('utils').choice_popup(require('luasnip').session.event_node)
            elseif match == 'LuasnipChoiceNodeLeave' then
              require('utils').choice_popup_close()
            elseif match == "LuasnipChangeChoice" then
              require('utils').update_choice_popup(require('luasnip').session.event_node)
            end
          end
        '';
      }
    ];
  };
}
