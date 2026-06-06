{
  flake.modules.generic.nixvim = {
    plugins.cord = {
      enable = true;
      settings.display.theme = "catppuccin";
    };
  };
}
