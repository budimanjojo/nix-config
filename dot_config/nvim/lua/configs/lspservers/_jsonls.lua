local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport  = true
local jsonls_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local jsonls_binary = jsonls_root_path .. '/jsonls/node_modules/.bin/vscode-json-language-server'

require('lspconfig').jsonls.setup {
  cmd = { jsonls_binary, '--stdio' },
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    }
  }
}
