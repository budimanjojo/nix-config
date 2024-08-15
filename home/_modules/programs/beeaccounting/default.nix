{
  lib,
  osConfig,
  config,
  pkgs,
  ...
}:
with lib;
let
  systemEnabled = myLib.systemEnabled "mySystem.containers.beeaccounting.enable" osConfig;
  isAdminUser = myLib.isAdminUser config.myHome.username osConfig;
  adminUser = osConfig.users.users.${osConfig.mySystem.adminUser};
in
{
  config = mkIf (systemEnabled && isAdminUser) {
    xdg.desktopEntries = {
      bee-app = {
        name = "Bee2.9";
        genericName = "Accounting Software";
        icon = ./bee-app.ico;
        exec =
          let
            script = pkgs.writeShellScriptBin "bee-app" ''
              ${pkgs.xorg.xhost}/bin/xhost +local:${toString adminUser.uid} > /dev/null 2>&1 && \
              ${pkgs.docker}/bin/docker exec --user ${toString adminUser.uid} beeaccounting-app java -Xmx1g -jar /app/BeeUI-2.9.jar
            '';
          in
          "${script}/bin/bee-app";
        categories = [
          "Office"
          "Finance"
          "Java"
        ];
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
        exec =
          let
            script = pkgs.writeShellScriptBin "bee-updater" ''
              ${pkgs.xorg.xhost}/bin/xhost +local:${toString adminUser.uid} > /dev/null 2>&1 && \
              ${pkgs.docker}/bin/docker exec --user ${toString adminUser.uid} beeaccounting-app java -Xmx1g -jar /app/BeeUpdater-2.9.jar
            '';
          in
          "${script}/bin/bee-updater";
        categories = [
          "Office"
          "Finance"
          "Java"
        ];
        comment = "Bee Accounting 2.9 Updater";
        type = "Application";
        terminal = false;
      };
    };

    wayland.windowManager.hyprland.settings.windowrulev2 = [
      "workspace 2, class:^(AppLauncher)$"
      "nodim, class:^(AppLauncher)$"
      "nofocus, class:^(AppLauncher)$, title:^(win)(.*)$"
      "noborder, class:^(AppLauncher)$, title:^(win)(.*)$"
      "noanim, class:^(AppLauncher)$, title:^(win)(.*)$"
      "nofocus, class:^(AppLauncher)$, title:^(JidePopup)$"
      "noborder, class:^(AppLauncher)$, title:^(JidePopup)$"
      "noanim, class:^(AppLauncher)$, title:^(JidePopup)$"
      "maxsize 400 180, class:^(AppLauncher)$, title:^(JidePopup)$"
    ];
  };
}
