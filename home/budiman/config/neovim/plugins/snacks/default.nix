{
  imports = [
    ./picker.nix
    ./input.nix
  ];

  config = {
    plugins.snacks.enable = true;
    colorschemes.catppuccin.settings.integrations.snacks.enabled = true;
  };
}
