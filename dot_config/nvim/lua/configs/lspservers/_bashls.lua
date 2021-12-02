local bashls_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local bashls_binary = bashls_root_path .. '/bash/node_modules/.bin/bash-language-server'

require('lspconfig').bashls.setup {
  cmd = { bashls_binary, 'start' }
}
