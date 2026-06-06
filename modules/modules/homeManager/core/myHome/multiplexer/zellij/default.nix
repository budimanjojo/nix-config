{
  flake.modules.homeManager.core =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.myHome.multiplexer.zellij;
      cmd = lib.getExe config.programs.zellij.package;
    in
    {
      options.myHome.multiplexer.zellij = {
        enable = lib.mkEnableOption "Zellij";
        package = lib.mkPackageOption pkgs "zellij" { };
      };

      config = lib.mkIf (cfg.enable) {
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
    };
}
