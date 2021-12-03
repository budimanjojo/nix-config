local lsp_installer_servers = require('nvim-lsp-installer.servers')
-- List of LSP I want to be installed
local requested_servers = {
  'bashls',
  'dockerls',
  'jsonls',
  'sumneko_lua',
  'yamlls'
}

-- Auto install requested LSP
for _, i in ipairs(requested_servers) do
  local server_available, requested_server = lsp_installer_servers.get_server(i)
  if server_available then
    if not requested_server:is_installed() then
      requested_server:install()
    end
  end
end

require('configs.lspservers._bashls')
require('configs.lspservers._dockerls')
require('configs.lspservers._jsonls')
require('configs.lspservers._sumneko_lua')
require('configs.lspservers._yamlls')
