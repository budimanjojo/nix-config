{ myLib, ... }:
{
  flake.modules.homeManager.core =
    {
      osConfig ? { },
      config,
      lib,
      pkgs,
      ...
    }:
    let
      systemEnabled = myLib.systemEnabled "mySystem.containers.beeaccounting.enable" osConfig;
      isAdminUser = config.myHome.username == "budiman";
      adminUserID = osConfig.users.users.budiman.uid;
    in
    {
      config = lib.mkIf (systemEnabled && isAdminUser) {
        xdg.desktopEntries = {
          bee-app = {
            name = "Bee2.9";
            genericName = "Accounting Software";
            icon = ./bee-app.ico;
            exec =
              let
                script = pkgs.writeShellScriptBin "bee-app" ''
                  ${pkgs.xhost}/bin/xhost +local:${toString adminUserID} > /dev/null 2>&1 && \
                  ${pkgs.docker}/bin/docker exec --user ${toString adminUserID} beeaccounting-app java -Xmx1g -jar /app/BeeUI-2.9.jar
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
                  ${pkgs.xhost}/bin/xhost +local:${toString adminUserID} > /dev/null 2>&1 && \
                  ${pkgs.docker}/bin/docker exec --user ${toString adminUserID} beeaccounting-app java -Xmx1g -jar /app/BeeUpdater-2.9.jar
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

        wayland.windowManager.hyprland.settings.windowrule = [
          "workspace 2, match:class ^(AppLauncher)$"
          "no_dim on, match:class ^(AppLauncher)$"
          "no_focus on, match:class ^(AppLauncher)$, match:title ^(win)(.*)$"
          "border_size 0, match:class ^(AppLauncher)$, match:title ^(win)(.*)$"
          "no_anim on, match:class ^(AppLauncher)$, match:title ^(win)(.*)$"
          "no_focus on, match:class ^(AppLauncher)$, match:title ^(JidePopup)$"
          "border_size 0, match:class ^(AppLauncher)$, match:title ^(JidePopup)$"
          "no_anim on, match:class ^(AppLauncher)$, match:title ^(JidePopup)$"
          "max_size 400 180, match:class ^(AppLauncher)$, match:title ^(JidePopup)$"
        ];
      };
    };
}
