require('gitsigns').setup {
  signs = {
    add          = { hl = 'GitSignsAdd', text = '󰐕', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '󰐕', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  linehl = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 500,
    ignore_whitespace = false
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', '<C-n>', function()
      if vim.wo.diff then return '<C-n>' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '<C-p>', function()
      if vim.wo.diff then return '<C-p>' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>ga', ':Gitsigns stage_hunk<CR>', { desc = "Git stage hunk" })
    map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = "Git reset hunk" })
    map('n', '<leader>gaa', gs.stage_buffer, { desc = "Git stage buffer" })
    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "Undo git stage" })
    map('n', '<leader>gra', gs.reset_buffer, { desc = "Reset git actions in buffer" })
    map('n', '<leader>gh', gs.preview_hunk, { desc = "Preview git actions in hunk" })
    map('n', '<leader>gd', gs.diffthis, { desc = "Git diff this hunk" })
    map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "Git diff this commit" })
  end
}
