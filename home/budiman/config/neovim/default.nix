{
  imports = [
    ./lsp.nix
    ./plugins
    ./general.nix
    ./appearance.nix
    ./autocmds.nix
    ./diagnostic.nix
    ./keymaps.nix
  ];
  config = {
    withNodeJs = true;
    withPerl = true;
    extraFiles = {
      "lua/utils.lua".source = ./lua/utils.lua;
    };
  };
}
