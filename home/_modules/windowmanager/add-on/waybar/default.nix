{
  config,
  lib,
  pkgs,
  ...
}:
let
  myHome = config.myHome;
  myHardware = config.myHardware;
  cfg = myHome.windowmanager.add-on.waybar;

  leftModules = (
    if myHome.windowmanager.sway.enable then
      [
        "sway/workspaces"
        "sway/mode"
      ]
    else if myHome.windowmanager.hyprland.enable then
      [
        "hyprland/workspaces"
        "hyprland/submap"
      ]
    else
      [ ]
  );
  centerModules = [ "clock" ];
  rightModules = [
    "network#down"
    "network#up"
  ];

  modulesCfg = {
    "network#down" = {
      format = "󰁅 {bandwidthDownBits}";
      tooltip-format = "{ifname} {ipaddr}";
      interval = 1;
    };
    "network#up" = {
      format = "󰁝 {bandwidthUpBits}";
      tooltip-format = "{ifname} {ipaddr}";
      interval = 1;
    };

    clock = {
      format = "{:%A, %d %b %I:%M%p}";
      interval = 1;
      timezone = "Asia/Jakarta";
      tooltip = false;
    };
    "custom/power" = {
      format = "󰤆 ";
      tooltip = true;
      on-click = "${pkgs.nwg-bar}/bin/nwg-bar";
    };
    "sway/workspaces" = {
      format = "{value}";
    };
    "sway/mode" = {
      format = "󰔡 {}";
      max-length = 100;
    };
    "hyprland/workspaces" = {
      format = "{name}";
      on-click = "activate";
      on-scroll-up = "${config.wayland.windowManager.hyprland.finalPackage}/bin/hyprctl dispatch workspace e+1";
      on-scroll-down = "${config.wayland.windowManager.hyprland.finalPackage}/bin/hyprctl dispatch workspace e-1";
    };
    "hyprland/submap" = {
      format = "󰔡 {}";
      max-length = 100;
    };
  };
in
{
  options.myHome.windowmanager.add-on.waybar = {
    enable = lib.mkEnableOption "waybar";
  };

  config = lib.mkIf (cfg.enable) {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = builtins.map (
        monitor:
        {
          output = monitor.name;
          layer = "top";
          position = "top";
          margin = "10 20 -5 20";

          modules-left = leftModules;
          modules-center = centerModules;
          modules-right =
            rightModules
            ++ (
              if monitor.primary then
                [
                  "tray"
                  "custom/power"
                ]
              else
                [ ]
            );
        }
        // modulesCfg
      ) myHardware.monitors;

      style = ''
        * {
            border: none;
            border-radius: 0;
            font-family: "UbuntuMono Nerd Font";
            font-size: 16px;
            font-weight: normal;
            padding: 1px;
        }

        button {
          min-height: 24px;
          min-width: 16px;
        }

        window#waybar {
            background-color: transparent;
            color: #C0CAF5;
            transition-property: background-color;
            transition-duration: .5s;
            border: 1px solid #C0CAF5;
            border-radius: 10px;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        #workspaces button {
            color: #C0CAF5;
            padding: 0 3px;
            border-radius: 5px;
        }

        #workspaces button.focused {
            color: #7AA2F7;
        }

        #workspaces button.active {
            color: #7AA2F7;
        }

        #workspaces button.urgent {
            color: #F7768E;
        }

        #mode {
            color: #F7768E;
            padding-left: 2px;
        }

        #submap {
            color: #F7768E;
            padding-left: 2px;
        }

        #clock {
            color: #BB9AF7;
        }

        #network.down {
            color: #9ECE6A;
            padding-right: 8px;
        }

        #network.up {
            color: #7AA2F7;
            padding-right: 8px;
        }

        #tray {
            color: #C0CAF5;
            padding-right: 8px;
        }

        #custom-power {
            color: #F7768E;
            padding-right: 8px;
        }
      '';
    };
  };
}
