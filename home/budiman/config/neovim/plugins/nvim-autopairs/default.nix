{
  config = {
    extraFiles."lua/nvim-autopairs/_rules.lua".source = ./_rules.lua;
    plugins.nvim-autopairs = {
      enable = true;
      luaConfig = {
        post = "require('nvim-autopairs._rules')";
      };
    };
  };
}
