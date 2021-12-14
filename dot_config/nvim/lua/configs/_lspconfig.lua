local lsp_installer = require('nvim-lsp-installer')
-- List of LSP I want to be installed
local requested_servers = {
  'ansiblels',
  'bashls',
  'dockerls',
  'jsonls',
  'sumneko_lua',
  'yamlls'
}

-- Auto install requested LSP
for _, name in ipairs(requested_servers) do
  local server_available, requested_server = lsp_installer.get_server(name)
  if server_available then
    if not requested_server:is_installed() then
      print("Installing " .. name)
      requested_server:install()
    end
  end
end

-- Diagnostic looks
vim.diagnostic.config {
  virtual_text = false,
  update_in_insert = true,
  float = {
    source = 'if_many'
  }
}

-- Signcolumn symbols
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Show diagnostics on hover
vim.o.updatetime = 150
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })]])

-- LSP Server Setup Goes Below
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(_, bufnr)
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

lsp_installer.on_server_ready(function(server)
  -- default options
  local default_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  local server_opts = {
    -- jsonls
    ['jsonls'] = function()
      default_opts.settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        }
      }
    end,

    -- sumneko_lua
    ['sumneko_lua'] = function()
      local runtime_path = vim.split(package.path, ';')
      default_opts.settings = {
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
        }
      }
    end,

    -- yamlls
    ['yamlls'] = function()
      default_opts.settings = {
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
    end,
  }

  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)
