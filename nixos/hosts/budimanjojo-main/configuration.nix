{ config, pkgs, ... }:
{
  config = {
    modules = {
      # Device specific options
      device = {
        cpu = "amd";
        gpu = "nvidia";
        monitors = [
          { name = "HDMI-A-1"; width = "1920"; height = "1080"; }
          { name = "DP-1"; width = "1920"; height = "1080"; }
        ];
        firefoxProfiles = {
          "budiman" = {
            id = 0;
            name = "budiman";
            isDefault = true;
            extensions = with config.nur.repos.rycee.firefox-addons; [
              bitwarden
              tokyo-night-v2
            ];
          };
          "lina" = {
            id = 1;
            name = "lina";
            isDefault = false;
            extensions = with config.nur.repos.rycee.firefox-addons; [
              bitwarden
              tokyo-night-v2
            ];
          };
        };
        hasBluetooth = true;
        hasSound = true;
      };

      # All of the available modules are listed below
      # Uncomment/comment do enable/disable module
      browser.firefox.enable = true;

      editor.neovim.enable = true;
      editor.geany.enable = true;

      homelab.diy-keyboard.enable = true;
      homelab.kubernetes.enable = true;

      # monitoring.grafana.enable = true;
      # monitoring.prometheus.enable = true;
      monitoring.smartd.enable = true;

      # multiplexer.tmux.enable = true;
      multiplexer.zellij.enable = true;

      program.adb.enable = true;
      program.discord.enable = true;
      program.hugo.enable = true;
      program.gaming.enable = true;
      program.graphic.enable = true;
      program.gui-utils.enable = true;
      program.libreoffice.enable = true;
      program.media.enable = true;
      program.nextcloud.enable = true;
      # program.obs-studio.enable = true;
      program.syncthing.enable = true;
      program.yamllint.enable = true;

      shell.fish.enable = true;
      shell.git.enable = true;

      windowmanager.hyprland.enable = true;
      # windowmanager.i3.enable = true;
      # windowmanager.sway.enable = true;
    };

    sops = {
      defaultSopsFile = ./secret.sops.yaml;
      age.keyFile = "${config.home.manager.home.homeDirectory}/.config/sops/age/keys.txt";
    };

    environment.variables.FLAKE = "${config.home.manager.home.homeDirectory}/Github/dotfiles";

    boot = {
      initrd.verbose = false;
      consoleLogLevel = 0;
      kernelParams = [ "quiet" ];
      plymouth.enable = true;
      loader = {
        systemd-boot = {
          enable = true;
          memtest86.enable = true;
          configurationLimit = 10;
        };
        timeout = 1;
        efi.canTouchEfiVariables = true;
      };
    };

    services = {
      openssh = {
        enable = true;
        settings = {
          permitRootLogin = "no";
        };
      };
    };

    networking = {
      firewall = {
        enable = true;
      };
    };
  };
}
