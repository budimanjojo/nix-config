require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'comment',
    'dockerfile',
    'fish',
    'go',
    'html',
    'lua',
    'python',
    'regex',
    'typescript',
    'vim',
    'yaml'
  },
  sync_install = true,
  highlight = {
    enable = true
  },
  autotag = {
    enable = true,
  }
}
