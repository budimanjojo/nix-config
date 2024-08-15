{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.multiplexer.zellij;
  cmd = lib.getExe config.programs.zellij.package;
  inherit (lib) mkEnableOption mkPackageOption mkIf;
in
{
  options.myHome.multiplexer.zellij = {
    enable = mkEnableOption "Zellij";
    package = mkPackageOption pkgs "zellij" { };
  };

  config = mkIf (cfg.enable) {
    programs = {
      zellij = {
        enable = true;
        package = cfg.package;
      };

      fish.interactiveShellInit = ''
        set -gx ZELLIJ_AUTO_ATTACH true
        set -gx ZELLIJ_AUTO_EXIT true
        eval (${cmd} setup --generate-auto-start fish | string collect)
      '';
    };

    xdg.configFile."zellij".source = ./config;
  };
}
