{
  config.plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    settings = {
      highlight = {
        enable = true;
        disable.__raw = ''
          function(_, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 50000
          end
        '';
      };
    };
  };
}
