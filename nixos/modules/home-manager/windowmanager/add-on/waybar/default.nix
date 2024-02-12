{ lib, config, inputs, system, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.waybar;
  deviceCfg = config.deviceCfg;
in {
  options.hm-modules.windowmanager.add-on.waybar = { enable = mkEnableOption "waybar"; };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = forEach deviceCfg.monitors (monitor: mapAttrs (n: v: v)
        {
          "output" = monitor.name;
          "layer" = "top";
          "position" = "top";
          "margin" = "10 20 -5 20";
          "modules-center" = [
            "clock"
          ];

          "network#down" = {
            "format" = "󰁅 {bandwidthDownBits}";
            "tooltip-format" = "{ifname} {ipaddr}";
            "interval" = 1;
          };

          "network#up" = {
            "format" = "󰁝 {bandwidthUpBits}";
            "tooltip-format" = "{ifname} {ipaddr}";
            "interval" = 1;
          };

          "clock" = {
            "format" = "{:%A, %d %b %I:%M%p}";
            "interval" = 1;
            "timezone" = "Asia/Jakarta";
            "tooltip" = false;
          };
        } //
        {
          "modules-right" = [
            "network#down"
            "network#up"
          ] ++ (if monitor == last deviceCfg.monitors then [
            "tray"
          ] else [ ]);
        } //
        (if config.hm-modules.windowmanager.sway.enable then {
          "modules-left" = [
            "sway/workspaces"
            "sway/mode"
          ];
          "sway/workspaces" = {
            "format" = "{value}";
          };
          "sway/mode" = {
            "format" = "󰔡 {}";
            "max-length" = 100;
          };
        } else if config.hm-modules.windowmanager.hyprland.enable then {
          "modules-left" = [
            "hyprland/workspaces"
            "hyprland/submap"
          ];
          "hyprland/workspaces" = {
            "format" = "{name}";
            "on-click" = "activate";
            "on-scroll-up" = "${inputs.hyprland.packages.${system}.hyprland}/bin/hyprctl dispatch workspace e+1";
            "on-scroll-down" = "${inputs.hyprland.packages.${system}.hyprland}/bin/hyprctl dispatch workspace e-1";
          };
          "hyprland/submap" = {
            "format" = "󰔡 {}";
            "max-length" = 100;
          };
        } else {
        })
      );

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
      '';
    };
  };
}
