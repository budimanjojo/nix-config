{ pkgs, ... }:
{
  imports = [
    ./picker.nix
    ./input.nix
  ];

  config = {
    plugins.snacks = {
      enable = true;
      # TODO: wait for the stable version to get commit 9ad5d53
      package = pkgs.unstable.vimPlugins.snacks-nvim;
    };
    colorschemes.catppuccin.settings.integrations.snacks.enabled = true;
  };
}
