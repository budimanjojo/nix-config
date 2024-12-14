require('nvim-treesitter.configs').setup {
  sync_install = true,
  highlight = {
    enable = true,
    disable = function(_, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) > 50000
    end,
  },
}
