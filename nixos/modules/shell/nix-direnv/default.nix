{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.shell.nix-direnv;
in {
  options.modules.shell.nix-direnv = { enable = mkEnableOption "nix-direnv"; };

  config = mkIf cfg.enable {
    home.manager = {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
      home.sessionVariables = {
        DIRENV_LOG_FORMAT = "";
      };
    };
  };
}
