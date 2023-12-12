{ pkgs, lib, config, pkgs-stable, ... }:
with lib;
let cfg = config.hm-modules.multiplexer.zellij;
in {
  options.hm-modules.multiplexer.zellij = { enable = mkEnableOption "zellij"; };

  config = mkIf cfg.enable {
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
}
