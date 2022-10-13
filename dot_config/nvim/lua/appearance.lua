local o = vim.o
local cmd = vim.cmd
local fn = vim.fn
local api = vim.api

o.background = 'dark'   -- Dark background
o.termguicolors = true  -- Enable 256 colors
o.signcolumn = 'yes'    -- Always show signcolumn
o.cursorcolumn = true   -- Cursor column

-- Colorscheme
require('tokyonight').setup {
  style = 'night',
}
cmd('colorscheme tokyonight')

-- Highlight on yank
local yankhighlight = api.nvim_create_augroup('yankhighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = yankhighlight
})

-- Floating window border color
api.nvim_set_hl(0, 'FloatBorder', { fg = '#C0CAF5' })

-- nvim-cmp kind highlight
api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { strikethrough = true, fg = '#C0CAF5' })
api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#7AA2F2' })
api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = '#7AA2F2' })
api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = '#9ECE6A' })
api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = '#9ECE6A' })
api.nvim_set_hl(0, 'CmpItemKindText', { fg = '#9ECE6A' })
api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#F7768E' })
api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#F7768E' })
api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = '#E0AF68' })
api.nvim_set_hl(0, 'CmpItemKindFile', { fg = '#E0AF68' })
api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#C0CAF5' })
api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = '#C0CAF5' })
api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = '#C0CAF5' })
