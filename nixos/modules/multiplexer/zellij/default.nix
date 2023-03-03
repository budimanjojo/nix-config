{ pkgs, lib, config, pkgs-stable, ... }:
with lib;
let cfg = config.modules.multiplexer.zellij;
in {
  options.modules.multiplexer.zellij = { enable = mkEnableOption "zellij"; };

  config = mkIf cfg.enable {
    home.manager = {
      programs.zellij.enable = true;
      xdg.configFile."zellij".source = ./configs;
      programs.fish.interactiveShellInit = ''
        if status is-interactive; and type -q zellij
          set -gx ZELLIJ_AUTO_ATTACH true
          set -gx ZELLIJ_AUTO_EXIT true
          eval (zellij setup --generate-auto-start fish | string collect)
        end

      '';
    };
  };
}
