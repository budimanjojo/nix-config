{
  config.plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    settings = {
      highlight = {
        enable = true;
        disable.__raw = ''
          function(_, bufnr)
            if string.find(vim.bo.filetype, 'chezmoitmpl') then
              return true
            end

            return vim.api.nvim_buf_line_count(bufnr) > 50000
          end
        '';
      };
    };
  };
}
