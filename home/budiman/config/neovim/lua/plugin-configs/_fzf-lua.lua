require('fzf-lua').setup {
  fzf_opts = {
    ['--layout'] = 'reverse-list',
    ['--prompt'] = ' ',
    ['--info'] = 'default',
  },
  hl = {
    border = 'FloatBorder',
  },
  builtin = {
    prompt = 'FzfLua  '
  },
  files = {
    prompt = 'Files  ',
    fd_opts = [[--color always --type f --hidden --exclude .git --exclude node_modules --exclude .npm --exclude .cache]]
  },
  grep = {
    prompt = 'Grep  ',
    input_prompt = 'Grep for  '
  },
  git = {
    commits = {
      prompt = 'Commits  ',
    }
  },
  buffers = {
    prompt = 'Buffers  ',
  },
  helptags = {
    prompt = 'Help  ',
  },
  lsp = {
    prompt = '  ',
    icons = {
      ['Error']       = { icon = '', color = 'red' },
      ['Warning']     = { icon = '', color = 'yellow' },
      ['Information'] = { icon = '', color = 'blue' },
      ['Hint']        = { icon = '󰌵', color = 'magenta' },
    },
    -- make lsp requests synchronous so the work with null-ls
    async_or_timeout = 3000,
  },
  nvim = {
    keymaps = {
      prompt = 'Keymaps  ',
    }
  }
}
