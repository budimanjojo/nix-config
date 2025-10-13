{
  imports = [
    ./plugins.nix
    ./lsp.nix
    ./plugins
    ./general.nix
    ./appearance.nix
    ./autocmds.nix
    ./diagnostic.nix
    ./keymaps.nix
  ];
  config = {
    extraFiles = {
      "lua/utils.lua".source = ./lua/utils.lua;
    };
  };
}
