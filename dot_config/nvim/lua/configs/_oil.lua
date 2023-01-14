local oil = require('oil')

oil.setup {
  columns = {
    'icon',
    'size',
  },
  win_options = {
    wrap = false,
    signcolumn = 'no',
    cursorcolumn = false,
    foldcolumn = '0',
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = 'n',
  },
  restore_win_options = true,
  skip_confirm_for_simple_edits = false,
  keymaps = {
    ['?'] = 'actions.show_help',
    ['<CR>'] = 'actions.select',
    ['<C-h>'] = 'actions.parent',
    ['<C-l>'] = 'actions.select',
    ['`'] = 'actions.open_cwd',
    ['<C-s>'] = 'actions.select_split',
    ['<C-v>'] = 'actions.select_vsplit',
    ['q'] = 'actions.close',
    ['<C-r>'] = 'actions.refresh',
    ['.'] = 'actions.toggle_hidden',
  },
  use_default_keymaps = false,
  view_options = {
    show_hidden = false,
  },
  float = {
    padding = 2,
    border = 'rounded',
    max_width = 50,
    max_height = 40,
    win_options = {
      winblend = 10,
    },
  },
}
