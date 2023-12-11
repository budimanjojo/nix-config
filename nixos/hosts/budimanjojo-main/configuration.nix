{ config,  ... }:
{
  config = {
    # Device specific options
    deviceCfg = {
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
      authorizedKeys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIgzLDHHRtLD9DLfNTX8Te9zBcDmEF33UPJ5HngP6aJAhdQln7ebSOzQoehxN0th644G9csnujxjNAStIEUjzeXO1NQQfEYGqDVxDL0jE4hXr1WVg+6GxQnV1nWP5Sd2i24+ElygCdw3KuteeNlfGZ7BKs91zySb03DICXPNcgXj6ZR9INalabFhbjeVG5MRH38KRR9cxZKbgW+eQZZwVtDRPzL7rAfaeeJPg7ZQ3Iu0SC3q5SskGQD5XfqCwPDx9n0GWva36jwNneifv5WFDh0U+xKaoVT4HJTWyV/vf3+fTji1yEsGMBbPexuD5aHvmun9SdgIlGw65GJB7Ibz47Bq/jVfnTV6o5BVDhEfwayHZgahODl5Uyc3VqkKoJh9IWivoBr/bLHXepiJGUReEw61nBc3JL9QC4J5ngterLXP/iapl185+JSvUzDjbtFDHLiXCqa8X17Cm9LSIKik/W7gM2tU63QcQd/p8H55he/Kgm94vWJlq98rjLCtBYTNQDSNAU6AFQqk2c3x23L09wSRIQJ1aUEq6aPx3yfbiRHyTslTyP4tg0I1U1o+jjh9tZV/+JpRcwg9xi9YLoGMAv9aUVGHodjehZw1wHnuql3ALiy/Nnm2LANDh4vhJ2fKsrBqhk8dyDdqFHFsLyTSXUAE4NKGG1AUV3fgMjvRRZZQ==" #work-pc
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDwktTcrOt7pytCS3C8qWg+eRsOjVgEHLJ5iOufmsa6dlmvqYroalwCgvN0YcjoqPdg53S5F12C3voV3nvRhRPB0AEQQYlWEynSFdc/omCktA7NqHcj/Wb/r+52Bq5xVqjXJDLT3f4YCE3pectoaiKgKIS+OoNMOErFmnxO/uSetNrvJLIr6DrxLRW/lZ+xPDiN1eIHM1ETfk9CxIYjD3UztBPAa6qfahchqd64DS8UevLNlvc/SxPniqaZfaxlmk1qMUfvTSPJAcMBSVK2EasHd7tUZhbHvoC+F9723fwtxedTFofgw3iZHWjz8pL7ngFNA4NpyUdDSId3mydPYk0E/rY8WVbknvGlRBjI1OnXWHTOZty26vcoNYKfjP/+1Q3TINVIkvjhNCmS6UuUGfBtqB8uJkUHi4wVYkXLHsK5vUxM664bkeCezHbkR7o17Sa0YbINL510UOi+PLUPEHk98yKh+Xlw77kc0EEQdvmRDTVI+YBmsJ83brtouc2cXm0=" #OP9 termux
      ];
    };

    modules = {
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
      shell.lf.enable = true;
      shell.openssh.enable = true;

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

    networking = {
      firewall = {
        enable = true;
      };
    };
  };
}
