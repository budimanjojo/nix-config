{
  flake.modules.generic.nixvim = {
    plugins.treesitter = {
      enable = true;
      nixvimInjections = true;
      highlight = {
        enable = true;
        disable = [ "chezmoitmpl" ];
      };
    };
  };
}
