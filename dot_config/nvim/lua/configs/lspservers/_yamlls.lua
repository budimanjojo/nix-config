local yamlls_root_path = vim.fn.stdpath('data') .. '/lsp_servers'
local yamlls_binary = yamlls_root_path .. '/yaml/node_modules/.bin/yaml-language-server'
require('lspconfig').yamlls.setup {
  cmd = { yamlls_binary, '--stio' },
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
