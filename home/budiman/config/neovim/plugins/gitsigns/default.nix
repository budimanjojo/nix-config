{
  config.plugins.gitsigns = {
    enable = true;
    settings = {
      linehl = true;
      current_line_blame = true;

      signs = {
        add.text = "󰐕";
        change.text = "󰐕";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
        untracked.text = "┆";
      };

      signs_staged_enable = true;
      signs_staged = {
        add.text = "󰐕";
        change.text = "󰐕";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
        untracked.text = "┆";
      };

      on_attach.__raw = ''
        function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          map('n', '<C-n>', function() gitsigns.nav_hunk('next') end, { desc = "Go to next hunk" })
          map('n', '<C-p>', function() gitsigns.nav_hunk('prev') end, { desc = "Go to prev hunk" })

          map('n', '<Leader>ga', gitsigns.stage_hunk, { desc = "Git stage hunk" })
          map('n', '<Leader>gr', gitsigns.reset_hunk, { desc = "Git reset hunk" })

          map('v', '<Leader>ga', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = "Git stage hunk" })
          map('v', '<Leader>gr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = "Git reset hunk" })

          map('n', '<Leader>gaa', gitsigns.stage_buffer, { desc = "Git stage buffer" })
          map('n', '<Leader>gra', gitsigns.reset_buffer, { desc = "Reset git actions in buffer" })
          map('n', '<Leader>gh', gitsigns.preview_hunk, { desc = "Preview git actions in hunk" })
          map('n', '<Leader>gd', gitsigns.diffthis, { desc = "Git diff this hunk" })
        end
      '';
    };
  };
}
