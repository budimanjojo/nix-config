{
  plugins.mini.modules.trailspace = { };

  # custom `trim_trailing_lastline` editorconfig property
  # that will remove trailing last lines from file
  # based on the `trim_trailing_whitespace`
  editorconfig.properties.trim_trailing_lastline = ''
    function(bufnr, val)
      assert(
        val == 'true' or val == 'false',
        'trim_trailing_lastline must be either "true" or "false"'
      )

      local group = vim.api.nvim_create_augroup(
        'nvim.editorconfig.trim_trailing_ll',
        {}
      )

      if val == 'true' then
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = group,
          buffer = bufnr,
          callback = function()
            MiniTrailspace.trim_last_lines()
          end,
        })
      else
        vim.api.nvim_clear_autocmds({
          event = 'BufWritePre',
          group = group,
        })
      end
    end
  '';
}
