{
  flake.modules.generic.nixvim = {
    plugins = {
      web-devicons.enable = true;
      colorizer.enable = true;
      ts-autotag.enable = true;
    };
  };
}
