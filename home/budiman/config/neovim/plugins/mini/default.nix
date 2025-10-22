{
  config.plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      icons = { };
      comment = { };
      indentscope = import ./indentscope.nix;
    };
  };
}
