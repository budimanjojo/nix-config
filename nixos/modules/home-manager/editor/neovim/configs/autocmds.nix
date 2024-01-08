{
  config = {
    autoGroups.disabledeindenthastag.clear = true;
    autoGroups.disableautocomment.clear = true;
    autoGroups.ftdetection.clear = true;
    autoGroups.ftconfiguration.clear = true;
    autoGroups.closewithq.clear = true;
    autoGroups.autoimportformatgo.clear = true;
    autoGroups.choicepopup.clear = true;

    autoCmd = [
      ## Disable removing indentation on files when first letter is # except some filetypes
      {
        event = [ "FileType" ];
        pattern = [ "*\\(^c$\\|^cpp$\\)\\@<!" ];
        group = "disabledeindenthastag";
        callback = {
          __raw = "function()
            vim.opt.cinkeys:remove({ '0#' })
          end";
        };
      }

      ## Disable autocomment on enter
      {
        event = [ "BufEnter" "CmdLineLeave" ];
        pattern = [ "*" ];
        group = "disableautocomment";
        callback = {
          __raw = "function()
            vim.opt.formatoptions:remove({ 'c', 'r','o' })
          end";
        };
      }

      ## Filetype detection
      {
        event = [ "BufRead" "BufNewFile" ];
        pattern = [ "*" ];
        group = "ftdetection";
        callback = {
          __raw = "function()
            vim.schedule(detectFt)
          end";
        };
      }

      ## Filetype configuration
      {
        event = [ "FileType" ];
        pattern = [ "*" ];
        group = "ftconfiguration";
        callback = {
          __raw = "function(arg)
            local ft = arg.match
            if ft == 'go' then
              vim.opt_local.shiftwidth = 4
              vim.opt_local.tabstop = 4
              vim.opt_local.softtabstop = 4
              vim.opt_local.expandtab = false
            elseif ft == 'gitcommit' then
              vim.opt_local.colorcolumn = { 73 }
            end
          end";
        };
      }

      ## Close some filetypes with <q>
      {
        event = [ "FileType" ];
        pattern = [
          "PlenaryTestPopup"
          "help"
          "lspinfo"
          "man"
          "notify"
          "qf"
          "query"
          "spectre_panel"
          "startuptime"
          "tsplayground"
          "neotest-output"
          "checkhealth"
          "neotest-summary"
          "neotest-output-panel"
        ];
        group = "closewithq";
        callback = {
          __raw = "function(event)
            vim.bo[event.buf].buflisted = false
            vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = event.buf, silent = true })
          end";
        };
      }

      ## Auto imports and format on save for golang
      {
        event = [ "BufWritePre" ];
        pattern = "*.go";
        group = "autoimportformatgo";
        callback = {
          __raw = "function()
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { 'source.organizeImports' } }
            local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
            for cid, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then
                  local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
                  vim. lsp.util.apply_workspace_edit(r.edit, enc)
                end
              end
            end
            vim.lsp.buf.format({ async = false })
          end";
        };
      }

      ## ChoiceNode popup in snippet
      {
        event = [ "User" ];
        pattern = [ "LuasnipChoiceNodeEnter" "LuasnipChoiceNodeLeave" "LuasnipChangeChoice" ];
        group = "choicepopup";
        callback = {
          __raw = "function(arg)
            local match = arg.match
            if match == 'LuasnipChoiceNodeEnter' then
              require('utils').choice_popup(require('luasnip').session.event_node)
            elseif match == 'LuasnipChoiceNodeLeave' then
              require('utils').choice_popup_close()
            elseif match == 'LuasnipChangeChoice' then
              require('utils').update_choice_popup(require('luasnip').session.event_node)
            end
          end";
        };
      }

    ];
    extraConfigLua = ''
      -- Filetype detection function
      local detectFt = function()
        local fpath = vim.fn.expand '%:p'
        if string.match(fpath, '.*/playbooks/.*%.yaml') or string.match(fpath, '.*/playbooks/.*%.yaml') then
          vim.o.filetype = 'yaml.ansible'
        elseif string.match(fpath, '.*/inventory/hosts%.yaml') or string.match(fpath, '.*/inventory/hosts%.yaml') then
          vim.o.filetype = 'yaml.ansible'
        elseif string.match(fpath, '.*/%.chezmoiscripts/.*%.sh.tmpl') then
          vim.o.filetype = 'sh.chezmoitmpl'
        elseif string.match(fpath, '.*/%.chezmoiscripts/.*%.fish.tmpl') then
          vim.o.filetype = 'fish.chezmoitmpl'
        end
      end
    '';
  };
}
