local hooks = require('ibl.hooks')

hooks.register(hooks.type.ACTIVE, function(bufnr)
  return not (vim.api.nvim_buf_line_count(bufnr) > 50000)
end)

require('ibl').setup()
