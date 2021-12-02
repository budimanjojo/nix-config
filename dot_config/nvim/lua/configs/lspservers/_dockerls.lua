local dockerls_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local dockerls_binary = dockerls_root_path .. '/dockerfile/node_modules/.bin/docker-langserver'

require('lspconfig').dockerls.setup {
  cmd = { dockerls_binary, '--stio' }
}
