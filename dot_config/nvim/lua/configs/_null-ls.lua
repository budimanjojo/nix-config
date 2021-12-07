local null_ls = require('null-ls')

null_ls.config {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.shfmt.with {
      extra_args = { '-i', '2', '-ci' }
    },
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.diagnostics.ansiblelint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.code_actions.shellcheck,
  },
  diagnostics_format = '[#{c}] #{m} (#{s})'
}

require('lspconfig')['null-ls'].setup{}
