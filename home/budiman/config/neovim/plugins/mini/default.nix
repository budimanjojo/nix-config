{
  config.plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      icons = { };
      indentscope = import ./indentscope.nix;
    };
  };
}
