{
  config = {
    extraConfigLuaPre = ''
      -- Space is <Leader>
      vim.keymap.set("", "<Space>", "<Nop>", { silent = true })
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "
    '';
    keymaps = [
      ## Fast save, save quit, force exit
      {
        mode = "n";
        key = "<Leader>w";
        action = ":w!<CR>";
        options.desc = "Write!";
      }
      {
        mode = "n";
        key = "<Leader>x";
        action = ":x<CR>";
        options.desc = "Write and exit";
      }
      {
        mode = "n";
        key = "<Leader>qq";
        action = ":q<CR>";
        options.desc = "Quit";
      }
      {
        mode = "n";
        key = "<Leader>qa";
        action = ":qa!<CR>";
        options.desc = "Quit all!";
      }
      {
        mode = "n";
        key = "<Leader>wq";
        action = ":wq!<CR>";
        options.desc = "Write and quit!";
      }

      ## Better cursor movement on wrapped line
      {
        mode = [
          "n"
          "v"
        ];
        key = "k";
        action = "gk";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "j";
        action = "gj";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<Up>";
        action = "gk";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<Down>";
        action = "gj";
      }
      {
        mode = "i";
        key = "<Up>";
        action = "<C-o>gk";
      }
      {
        mode = "i";
        key = "<Down>";
        action = "<C-o>gj";
      }

      ## Y to yank from cursor to end of line
      {
        mode = "n";
        key = "Y";
        action = "y$";
        options.desc = "Yank to end of line";
      }

      ## Move selected lines up and down with updated indentation
      {
        mode = "v";
        key = "J";
        action = ">+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "K";
        action = "<-2<CR>gv=gv";
      }

      ## Better search movement
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options.desc = "Go to the next search result and center";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options.desc = "Go to the previous search result and center";
      }

      ## Move between splits
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options.desc = "Move focus to split above";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options.desc = "Move focus to split below";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options.desc = "Move focus to left split";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options.desc = "Move focus to right split";
      }

      ## Open new split
      {
        mode = "n";
        key = "<Leader>s";
        action = ":new<CR>";
        options.desc = "Open new horizontal split";
      }
      {
        mode = "n";
        key = "<Leader>v";
        action = ":vnew<CR>";
        options.desc = "Open new vertical split";
      }

      ## Move cursors in Insert mode
      {
        mode = "i";
        key = "<C-k>";
        action = "<Up>";
      }
      {
        mode = "i";
        key = "<C-j>";
        action = "<Down>";
      }
      {
        mode = "i";
        key = "<C-h>";
        action = "<Left>";
      }
      {
        mode = "i";
        key = "<C-l>";
        action = "<Right>";
      }

      ## Tab navigation
      {
        mode = "n";
        key = "<Leader>tn";
        action = ":tabnew<CR>";
        options.desc = "Create new tab";
      }
      {
        mode = "n";
        key = "<Leader>tq";
        action = ":tabclose<CR>";
        options.desc = "Close current tab";
      }
      {
        mode = "n";
        key = "<Leader>th";
        action = ":tabprev<CR>";
        options.desc = "Go to the previous tab";
      }
      {
        mode = "n";
        key = "<Leader>tl";
        action = ":tabnext<CR>";
        options.desc = "Go to the next tab";
      }
      {
        mode = "n";
        key = "<Leader>te";
        action = ":tabedit <C-r>=expand('%:p:h')<CR>/";
        options.desc = "Open new tab with current buffer's path";
      }

      ## Indent or de-indent
      {
        mode = "n";
        key = "<Tab>";
        action.__raw = "function() return require('utils').always_working_indent_line() end";
        options.desc = "Add indentation";
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<<";
        options.desc = "De-indentation";
      }
      {
        mode = "v";
        key = "<Tab>";
        action = ">gv";
        options.desc = "Add indentation";
      }
      {
        mode = "v";
        key = "<S-Tab>";
        action = "<gv";
        options.desc = "De-indentation";
      }

      ## Jumping
      {
        mode = "n";
        key = "<Leader>hh";
        action = "<C-o>";
        options.desc = "Jump to older cursor position";
      }
      {
        mode = "n";
        key = "<Leader>ll";
        action = "<C-i>";
        options.desc = "Jump to newer cursor position";
      }

      ## lspconfig
      {
        mode = "n";
        key = "<Leader>lr";
        action = ":LspRestart<CR>";
        options.desc = "Restart LSP";
      }

      ## FzfLua
      {
        mode = "n";
        key = "<Leader>fz";
        action = ":FzfLua<CR>";
      }
      {
        mode = "n";
        key = "<Leader>ff";
        action = ":FzfLua files<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fg";
        action = ":FzfLua live_grep<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fc";
        action = ":FzfLua git_commit<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fb";
        action = ":FzfLua buffers<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fh";
        action = ":FzfLua help_tags<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fk";
        action = ":FzfLua keymaps<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fe";
        action = ":FzfLua lsp_document_diagnostics<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fr";
        action = ":FzfLua lsp_references<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fd";
        action = ":FzfLua lsp_typedefs<CR>";
      }

      ## Trouble
      {
        mode = "n";
        key = "<Leader>xx";
        action = ":TroubleToggle<CR>";
      }
      {
        mode = "n";
        key = "<Leader>xr";
        action = ":TroubleToggle lsp_references<CR>";
      }

      ## oil.nvim
      {
        mode = "n";
        key = "<C-f>";
        action.__raw = "function()
          if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(0), 'filetype') == 'oil' then
            return require('oil').close()
          else
            return require('oil').open_float(require('utils').current_path())
          end
        end";
      }

      ## null-ls
      {
        mode = "n";
        key = "<Leader>pp";
        action.__raw = "function()
          if vim.fn.has('nvim-0.8') == 1 then
            return vim.lsp.buf.format()
          else
            return vim.lsp.buf.formatting()
          end
        end";
        options.desc = "Fix document formatting";
      }
      {
        mode = "v";
        key = "<Leader>pp";
        action.__raw = "function()
          return vim.lsp.buf.range_formatting()
        end";
        options.desc = "Fix document formatting";
      }

      ## FTerm
      {
        mode = [
          "n"
          "t"
        ];
        key = "<C-t>";
        action.__raw = "function()
          return require('FTerm').toggle()
        end";
        options.desc = "Toggle floating terminal";
      }

      ## b64.nvim
      {
        mode = "v";
        key = "<Leader>be";
        action = ":<C-u>lua require('b64').encode()<CR>";
        options.desc = "Encode text with base64";
      }
      {
        mode = "v";
        key = "<Leader>bd";
        action = ":<C-u>lua require('b64').decode()<CR>";
        options.desc = "Decode base64 encoded text";
      }

      ## grug-far
      {
        mode = [
          "n"
          "v"
        ];
        key = "<Leader>sr";
        action.__raw = "function()
          return require('grug-far').open({
            prefills = { search = vim.api.nvim_get_current_line() }
          })
        end";
        options.desc = "Open grug-far search and replace window with current line under cursor prefilled";
      }
    ];
  };
}
