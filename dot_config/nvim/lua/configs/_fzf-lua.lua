require('fzf-lua').setup {
  fzf_opts = {
    ['--layout'] = 'reverse-list',
    ['--prompt'] = '⮞ ',
    ['--info'] = 'default'
  },
  builtin = {
    prompt = 'FzfLua ⮞ '
  },
  files = {
    prompt = 'Files ⮞ ',
    fd_opts = [[--color never --type f --hidden --exclude .git --exclude node_modules --exclude .npm --exclude .cache]]
  },
  grep = {
    prompt = 'Grep ⮞ ',
    input_prompt = 'Grep for ⮞ '
  },
  buffers = {
    prompt = 'Buffers ⮞ ',
  },
  helptags = {
    prompt = 'Help ⮞ ',
  },
  lsp = {
    prompt = ' ⮞ ',
    icons = {
      ['Error']       = { icon = '', color = 'red' },
      ['Warning']     = { icon = '', color = 'yellow' },
      ['Information'] = { icon = '', color = 'blue' },
      ['Hint']        = { icon = '', color = 'magenta' },
    },
  },
  nvim = {
    keymaps = {
      prompt = 'Keymaps ⮞ ',
    }
  }
}
