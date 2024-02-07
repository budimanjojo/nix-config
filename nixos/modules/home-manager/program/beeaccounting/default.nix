{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.program.beeaccounting;
  deviceCfg = config.deviceCfg;
in {
  options.hm-modules.program.beeaccounting = { enable = mkEnableOption "beeaccounting"; };

  config = mkIf cfg.enable {
    xdg.desktopEntries = {
      bee-app = {
        name = "Bee2.9";
        genericName = "Accounting Software";
        icon = ./bee-app.ico;
        exec = let
          script = pkgs.writeShellScriptBin "bee-app" ''
            ${pkgs.xorg.xhost}/bin/xhost +local:${toString deviceCfg.uid} > /dev/null 2>&1 && \
            ${pkgs.docker}/bin/docker exec --user ${toString deviceCfg.uid} beeaccounting-app java -Xmx1g -jar /app/BeeUI-2.9.jar
          '';
        in "${script}/bin/bee-app";
        categories = ["Office" "Finance" "Java"];
        comment = "Bee Accounting 2.9 Application";
        type = "Application";
        terminal = false;
        settings = {
          StartupWMClass = "AppLauncher";
        };
      };
      bee-updater = {
        name = "Bee2.9-Updater";
        genericName = "Software Updater";
        icon = ./bee-updater.ico;
        exec = let
          script = pkgs.writeShellScriptBin "bee-updater" ''
            ${pkgs.xorg.xhost}/bin/xhost +local:${toString deviceCfg.uid} > /dev/null 2>&1 && \
            ${pkgs.docker}/bin/docker exec --user ${toString deviceCfg.uid} beeaccounting-app java -Xmx1g -jar /app/BeeUpdater-2.9.jar
          '';
        in "${script}/bin/bee-updater";
        categories = ["Office" "Finance" "Java"];
        comment = "Bee Accounting 2.9 Updater";
        type = "Application";
        terminal = false;
      };
    };
  };
}
