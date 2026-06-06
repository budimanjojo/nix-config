{
  flake.modules.generic.nixvim = {
    extraFiles = {
      "lua/utils.lua".source = ./lua/utils.lua;
    };
  };
}
