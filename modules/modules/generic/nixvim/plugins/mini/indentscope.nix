{
  flake.modules.generic.nixvim = {
    plugins.mini.modules.indentscope = {
      draw.delay = 0;
      symbol = "▎";
      options.try_as_border = true;
    };
  };
}
