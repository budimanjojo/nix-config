{ pkgs, lib, config, ... }:
with lib;
let cfg = config.hm-modules.shell.nix-direnv;
in {
  options.hm-modules.shell.nix-direnv = { enable = mkEnableOption "nix-direnv"; };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    home.sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };
  };
}
