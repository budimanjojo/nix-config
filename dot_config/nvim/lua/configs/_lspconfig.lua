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

-- LSP Server Setup Goes Below

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
  require 'lsp_signature'.on_attach()
  local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_map('n', 'rn', ':lua vim.lsp.buf.rename()<CR>', opts)
  buf_map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  buf_map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', opts)
  buf_map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  buf_map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
end

-- bashls
local bashls_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local bashls_binary = bashls_root_path .. '/bash/node_modules/.bin/bash-language-server'

lspconfig.bashls.setup {
  cmd = { bashls_binary, 'start' },
  on_attach = on_attach,
  capabilities = capabilities
}

-- dockerls
local dockerls_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local dockerls_binary = dockerls_root_path .. '/dockerfile/node_modules/.bin/docker-langserver'

require('lspconfig').dockerls.setup {
  cmd = { dockerls_binary, '--stio' },
  on_attach = on_attach,
  capabilities = capabilities
}

-- jsonls
local jsonls_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local jsonls_binary = jsonls_root_path .. '/jsonls/node_modules/.bin/vscode-json-language-server'

require('lspconfig').jsonls.setup {
  cmd = { jsonls_binary, '--stdio' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    }
  }
}

-- sumnoko_lua
local system_name
if vim.fn.has('mac') == 1 then
  system_name = 'MacOS'
elseif vim.fn.has('unix') == 1 then
  system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

local sumneko_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local sumneko_binary = sumneko_root_path .. '/sumneko_lua/extension/server/bin/' .. system_name .. '/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?./init.lua')

require('lspconfig').sumneko_lua.setup {
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/sumneko_lua/extension/server/main.lua' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- yamlls
local yamlls_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local yamlls_binary = yamlls_root_path .. '/yaml/node_modules/.bin/yaml-language-server'
require('lspconfig').yamlls.setup {
  cmd = { yamlls_binary, '--stdio' },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'yaml' },
  settings = {
    yaml = {
      schemas = {
        kubernetes = {
          '01-namespace.yaml',
          'deployment.yaml',
          'daemonset.yaml',
          'statefulset.yaml',
          'service.yaml',
          'pv.yaml',
          'pvc.yaml',
          'configmap.yaml',
          'secret.yaml',
          'rbac.yaml',
          'crd.yaml',
          'storageclass.yaml',
          'cronjob.yaml'
        },
        ['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] = {
          'docker-compose.yml',
          'docker-compose.yaml'
        },
        ['https://json.schemastore.org/github-workflow'] = {
          '.github/workflows/**.yml',
          '.github/workflows/**.yaml'
        },
        ['https://json.schemastore.org/github-actions'] = {
          'action.yml',
          'action.yaml'
        },
        ['https://json.schemastore.org/gitlab-ci'] = '.gitlab-ci.yml',
        ['https://json.schemastore.org/kustomization'] = {
          'kustomization.yml',
          'kustomization.yaml'
        },
        ['https://json.schemastore.org/pre-commit-config'] = {
          '.pre-commit-config.yml',
          '.pre-commit-config.yaml',
        }
      }
    }
  }
}
