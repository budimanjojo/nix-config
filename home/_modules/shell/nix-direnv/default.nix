{ config, lib, ... }:
let
  cfg = config.myHome.shell.nix-direnv;
in
{
  options.myHome.shell.nix-direnv = {
    enable = lib.mkEnableOption "nix-direnv";
  };

  config = lib.mkIf (cfg.enable) {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    home.sessionVariables.DIRENV_LOG_FORMAT = "";
  };
}
