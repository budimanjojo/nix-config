-- Diagnostic looks
vim.diagnostic.config {
  virtual_text = false,
  update_in_insert = true,
  float = {
    source = 'if_many'
  }
}

-- Signcolumn symbols
local signs = { Error = '󰅚 ', Warn = '󰗖 ', Hint = '󰌶 ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Show diagnostics on hover
vim.o.updatetime = 150
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])

-- LSP Server Setup Goes Below
require('mason').setup {
  -- Prioritize nix native pkgs
  PATH = "append",
}
require('mason-lspconfig').setup {
  automatic_installation = {
    exclude = { "nil_ls" }
  },
  -- ui = {
  --   check_outdated_servers_on_open = true
  -- }
}
require('mason-tool-installer').setup {
  ensure_installed = {
    -- formatting
    'prettierd',
    'shfmt',

    -- diagnostics
    'markdownlint',
    'shellcheck',
    'write-good',
    'yamllint',
  },
  auto_update = true,
  run_on_start = true
}

local function get_client_capabilities(isClangd)
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }

  if isClangd then
    capabilities.offsetEncoding = "utf-8"
  end

  return capabilities
end

local lspconfig = require('lspconfig')
local capabilities = get_client_capabilities(false)
local clangd_capabilities = get_client_capabilities(true)
local on_attach = function(_, bufnr)
  require 'lsp_signature'.on_attach()
  local keymap = vim.keymap
  local opts = { buffer = bufnr }

  keymap.set('n', 'rn', vim.lsp.buf.rename, { unpack(opts), desc = "Do LSP rename action" })
  keymap.set('n', 'gd', vim.lsp.buf.definition, { unpack(opts), desc = "Do LSP get definition action" })
  keymap.set('n', 'gD', vim.lsp.buf.declaration, { unpack(opts), desc = "Do LSP get declaration action" })
  keymap.set('n', 'gh', function() return require('utils').fix_buf_hover() end, { unpack(opts), desc = "Do LSP hover action" })
  keymap.set('n', 'gr', vim.lsp.buf.references, { unpack(opts), desc = "Do LSP get references action" })
  keymap.set('n', 'gi', vim.lsp.buf.implementation, { unpack(opts), desc = "Do LSP get implementation action"})
end

-- ansiblels
lspconfig.ansiblels.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- bashls
lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- clangd
lspconfig.clangd.setup {
  capabilities = clangd_capabilities,
  on_attach = on_attach,
}

-- cssls
lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- dockerls
lspconfig.dockerls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- gopls
lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- javascript
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- jsonls
lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'json', 'jsonc', 'json5' },
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    }
  }
}

-- nil
lspconfig.nil_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- pyright
lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- lua-language-server
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        preloadFileSize = 200,
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    }
  }
}

-- yamlls
lspconfig.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    yaml = {
      customTags = {
        '!include_dir_list',
        '!include_dir_named',
        '!include_dir_merge_list',
        '!include_dir_merge_named',
        '!secret',
        '!env_var',
      },
      schemas = {
        kubernetes = {
          'namespace.yaml',
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
        },
        ['https://schemas.budimanjojo.com/helmrelease_v2beta1.json'] = {
          'helmrelease.yaml',
          'helm-release.yaml'
        },
        ['https://schemas.budimanjojo.com/kustomization_v1beta2.json'] = {
          'kustomization-fluxCRD.yaml',
        },
        ['https://schemas.budimanjojo.com/replicationsource_v1alpha1.json'] = {
          'replicationsource-volsyncCRD.yaml'
        },
        ['https://schemas.budimanjojo.com/ingressroute_v1alpha1.json'] = {
          'ingress-traefikCRD.yaml'
        }
      }
    }
  }
}

-- null-ls
local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.shfmt.with {
      extra_args = { '-i', '2', '-ci' }
    },
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.diagnostics.ansiblelint.with {
      filetypes = { 'yaml.ansible' }
    },
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.code_actions.shellcheck,
  },
  diagnostics_format = '[#{c}] #{m} (#{s})'
}
