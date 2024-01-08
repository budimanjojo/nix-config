{
  imports = [
    ./plugins.nix
    ./general.nix
    ./appearance.nix
    ./autocmds.nix
    ./keymaps.nix
  ];
  config = {
    extraFiles = {
      "lua/utils.lua" = builtins.readFile ./lua/utils.lua;
    };
  };
}
