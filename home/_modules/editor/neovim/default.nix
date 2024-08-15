{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.editor.neovim;
in
{
  options.myHome.editor.neovim = {
    enable = lib.mkEnableOption "Neovim";
    package = lib.mkPackageOption pkgs "neovim" { };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [ cfg.package ];

    programs.fish = {
      shellAliases = {
        vimdiff = "nvim -d";
      };
      shellAbbrs = {
        vi = "nvim";
        vim = "nvim";
      };
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };
}
