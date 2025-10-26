{
  config = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<C-t>]]";
        direction = "float";
        insert_mapping = false;
        shade_terminals = false;
        highlights = {
          FloatBorder.link = "FloatBorder";
          NormalFloat.link = "NormalFloat";
        };
        float_opts = {
          border = "curved";
          width.__raw = ''
            function()
              return math.ceil(vim.o.columns * 0.8)
            end
          '';
          height.__raw = ''
            function()
              return math.ceil((vim.o.lines - 2) * 0.8)
            end
          '';
        };
      };
    };

  };
}
