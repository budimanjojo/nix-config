{
  flake.modules.homeManager.core =
    { pkgs, ... }:
    {
      myHome.editor.neovim = {
        enable = true;
        package = pkgs.thisflake.neovim;
      };
    };
}
