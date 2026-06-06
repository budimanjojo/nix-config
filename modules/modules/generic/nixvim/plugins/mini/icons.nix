{
  flake.modules.generic.nixvim = {
    plugins.mini = {
      mockDevIcons = true;
      modules.icons = { };
    };
  };
}
