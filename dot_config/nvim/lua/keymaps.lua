local keymap = vim.keymap
local g = vim.g

-- Spacebar is <Leader>
keymap.set('', '<Space>', '<Nop>', { silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

-- Fast save, save quit, force exit
keymap.set('n', '<Leader>w', ':w!<CR>')
keymap.set('n', '<Leader>x', ':x<CR>')
keymap.set('n', '<Leader>qq', ':q<CR>')
keymap.set('n', '<Leader>qa', ':qa!<CR>')
keymap.set('n', '<Leader>wq', ':wq!<CR>')

-- Better cursor movement on wrapped line
keymap.set('n', 'k', 'gk')
keymap.set('n', 'j', 'gj')
keymap.set('v', 'k', 'gk')
keymap.set('v', 'j', 'gj')
keymap.set('n', '<Up>', 'gk')
keymap.set('n', '<Down>', 'gj')
keymap.set('v', '<Up>', 'gk')
keymap.set('v', '<Down>', 'gj')
keymap.set('i', '<Up>', '<C-o>gk')
keymap.set('i', '<Down>', '<C-o>gj')

-- Y to yank from cursor to end of line
keymap.set('n', 'Y', 'y$')

-- Move paragraph
keymap.set('', 'K', '{')
keymap.set('', 'J', '}')

-- Move to first and last char
keymap.set('', 'H', '^')
keymap.set('', 'L', '$')

-- Move between splits
keymap.set('n', '<C-k>', '<C-w><C-k>')
keymap.set('n', '<C-j>', '<C-w><C-j>')
keymap.set('n', '<C-h>', '<C-w><C-h>')
keymap.set('n', '<C-l>', '<C-w><C-l>')

-- Open new split
keymap.set('n', '<Leader>s', ':new<CR>')
keymap.set('n', '<Leader>v', ':vnew<CR>')

-- Move cursors in Insert mode
keymap.set('i', '<C-k>', '<Up>')
keymap.set('i', '<C-j>', '<Down>')
keymap.set('i', '<C-h>', '<Left>')
keymap.set('i', '<C-l>', '<Right>')

-- Tab navigation
keymap.set('n', '<Leader>tn', ':tabnew<CR>')
keymap.set('n', '<Leader>tq', ':tabclose<CR>')
keymap.set('n', '<Leader>th', ':tabprev<CR>')
keymap.set('n', '<Leader>tl', ':tabnext<CR>')

-- Open new tab with current buffer's path
keymap.set('n', '<Leader>te', ':tabedit <C-r>=expand("%:p:h")<CR>/')

-- Indent or de-indent
keymap.set('n', '<Tab>', '>>')
keymap.set('n', '<S-Tab>', '<<')
keymap.set('v', '<Tab>', '>gv')
keymap.set('v', '<S-Tab>', '<gv')

-- Jumping
keymap.set('n', '<Leader>hh', '<C-o>')
keymap.set('n', '<Leader>ll', '<C-i>')

-- lspconfig
keymap.set('n', '<Leader>lr', ':LspRestart<CR>')

-- FzfLua
keymap.set('n', '<Leader>fz', ':FzfLua<CR>')
keymap.set('n', '<Leader>ff', ':FzfLua files<CR>')
keymap.set('n', '<Leader>fg', ':FzfLua live_grep<CR>')
keymap.set('n', '<Leader>fc', ':FzfLua git_commits<CR>')
keymap.set('n', '<Leader>fb', ':FzfLua buffers<CR>')
keymap.set('n', '<Leader>fh', ':FzfLua help_tags<CR>')
keymap.set('n', '<Leader>fk', ':FzfLua keymaps<CR>')
keymap.set('n', '<Leader>fe', ':FzfLua lsp_document_diagnostics<CR>')
keymap.set('n', '<Leader>fr', ':FzfLua lsp_references<CR>')
keymap.set('n', '<Leader>fd', ':FzfLua lsp_typedefs<CR>')

-- Trouble
keymap.set('n', '<Leader>xx', ':TroubleToggle<CR>')
keymap.set('n', '<Leader>xr', ':TroubleToggle lsp_references<CR>')

-- lir.nvim
keymap.set('n', '<C-f>', function() return require("lir.float").toggle() end)

-- null-ls
if vim.fn.has('nvim-0.8') == 1 then
  keymap.set('n', '<Leader>pp', function() return vim.lsp.buf.format() end)
else
  keymap.set('n', '<Leader>pp', function() return vim.lsp.buf.formatting() end)
end
keymap.set('v', '<Leader>pp', function() return vim.lsp.buf.range_formatting() end)

-- FTermo
keymap.set({ 'n', 't' }, '<C-t>', function() return require("FTerm").toggle() end)
