local function mapnoremap(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Spacebar is <Leader>
vim.g.mapleader = ' '

-- Fast save, save quit, force exit
mapnoremap('n', '<Leader>w', ':w!<CR>')
mapnoremap('n', '<Leader>x', ':x<CR>')
mapnoremap('n', '<Leader>qq', ':q<CR>')
mapnoremap('n', '<Leader>qa', ':qa!<CR>')
mapnoremap('n', '<Leader>wq', ':wq!<CR>')

-- Better cursor movement on wrapped line
mapnoremap('n', 'k', 'gk')
mapnoremap('n', 'j', 'gj')
mapnoremap('v', 'k', 'gk')
mapnoremap('v', 'j', 'gj')
mapnoremap('n', '<Up>', 'gk')
mapnoremap('n', '<Down>', 'gj')
mapnoremap('v', '<Up>', 'gk')
mapnoremap('v', '<Down>', 'gj')
mapnoremap('i', '<Up>', '<C-o>gk')
mapnoremap('i', '<Down>', '<C-o>gj')

-- Y to yank from cursor to end of line
mapnoremap('n', 'Y', 'y$')

-- Move paragraph
mapnoremap('', 'K', '{')
mapnoremap('', 'J', '}')

-- Move to first and last char
mapnoremap('', 'H', '^')
mapnoremap('', 'L', '$')

-- Move between splits
mapnoremap('n', '<C-k>', '<C-w><C-k>')
mapnoremap('n', '<C-j>', '<C-w><C-j>')
mapnoremap('n', '<C-h>', '<C-w><C-h>')
mapnoremap('n', '<C-l>', '<C-w><C-l>')

-- Open new split
mapnoremap('n', '<Leader>s', ':new<CR>')
mapnoremap('n', '<Leader>v', ':vnew<CR>')

-- Move cursors in Insert mode
mapnoremap('n', '<C-k>', '<Up>')
mapnoremap('n', '<C-j>', '<Down>')
mapnoremap('n', '<C-h>', '<Left>')
mapnoremap('n', '<C-l>', '<Right>')

-- Tab navigation
mapnoremap('n', '<Leader>tn', ':tabnew<CR>')
mapnoremap('n', '<Leader>tq', ':tabclose<CR>')
mapnoremap('n', '<Leader>th', ':tabprev<CR>')
mapnoremap('n', '<Leader>tl', ':tabnext<CR>')

-- Open new tab with current buffer's path
mapnoremap('n', '<Leader>te', ':tabedit <C-r>=expand("%:p:h")<CR>/')

-- Indent or de-indent
mapnoremap('n', '<Tab>', '>>')
mapnoremap('n', '<S-Tab>', '<<')
mapnoremap('v', '<Tab>', '>qv')
mapnoremap('v', '<S-Tab>', '<qv')

-- Telescope
mapnoremap('n', '<Leader>ff', ':Telescope find_files<CR>')
mapnoremap('n', '<Leader>fg', ':Telescope live_grep theme=get_cursor<CR>')
mapnoremap('n', '<Leader>fb', ':Telescope buffers theme=get_cursor<CR>')
mapnoremap('n', '<Leader>fh', ':Telescope help_tags<CR>')
mapnoremap('n', '<Leader>fk', ':Telescope keymaps<CR>')
mapnoremap('n', '<Leader>fe', ':Telescope document_diagnostics<CR>')
mapnoremap('n', '<Leader>fr', ':Telescope lsp_references<CR>')
mapnoremap('n', '<Leader>fd', ':Telescope lsp_type_definitions<CR>')

-- Trouble
mapnoremap('n', '<Leader>xx', ':TroubleToggle<CR>')
mapnoremap('n', '<Leader>xr', ':TroubleToggle lsp_references<CR>')

-- nvim-tree
mapnoremap('n', '<C-f>', ':NvimTreeToggle<CR>')
