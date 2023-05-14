{ config, ... }:
{
  config = {
    modules = {
      # Device specific options
      device = {
        cpu = "vm";
        gpu = "vm";
        monitors = [
          { name = "Virtual-1"; width = "1280"; height = "800"; }
        ];
        hasBluetooth = false;
        hasSound = false;
        authorizedKeys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIgzLDHHRtLD9DLfNTX8Te9zBcDmEF33UPJ5HngP6aJAhdQln7ebSOzQoehxN0th644G9csnujxjNAStIEUjzeXO1NQQfEYGqDVxDL0jE4hXr1WVg+6GxQnV1nWP5Sd2i24+ElygCdw3KuteeNlfGZ7BKs91zySb03DICXPNcgXj6ZR9INalabFhbjeVG5MRH38KRR9cxZKbgW+eQZZwVtDRPzL7rAfaeeJPg7ZQ3Iu0SC3q5SskGQD5XfqCwPDx9n0GWva36jwNneifv5WFDh0U+xKaoVT4HJTWyV/vf3+fTji1yEsGMBbPexuD5aHvmun9SdgIlGw65GJB7Ibz47Bq/jVfnTV6o5BVDhEfwayHZgahODl5Uyc3VqkKoJh9IWivoBr/bLHXepiJGUReEw61nBc3JL9QC4J5ngterLXP/iapl185+JSvUzDjbtFDHLiXCqa8X17Cm9LSIKik/W7gM2tU63QcQd/p8H55he/Kgm94vWJlq98rjLCtBYTNQDSNAU6AFQqk2c3x23L09wSRIQJ1aUEq6aPx3yfbiRHyTslTyP4tg0I1U1o+jjh9tZV/+JpRcwg9xi9YLoGMAv9aUVGHodjehZw1wHnuql3ALiy/Nnm2LANDh4vhJ2fKsrBqhk8dyDdqFHFsLyTSXUAE4NKGG1AUV3fgMjvRRZZQ== budimanjojo@gmail.com" #work-pc
        ];
      };

      # All of the available modules are listed below
      # Uncomment/comment do enable/disable module
      browser.firefox.enable = true;

      editor.neovim.enable = true;
      editor.geany.enable = true;

      # homelab.diy-keyboard.enable = true;
      homelab.kubernetes.enable = true;

      monitoring.grafana.enable = true;
      monitoring.prometheus.enable = true;
      # monitoring.smartd.enable = true;

      # multiplexer.tmux.enable = true;
      # multiplexer.zellij.enable = true;

      # program.adb.enable = true;
      # program.discord.enable = true;
      # program.hugo.enable = true;
      # program.gaming.enable = true;
      # program.graphic.enable = true;
      program.gui-utils.enable = true;
      # program.libreoffice.enable = true;
      # program.media.enable = true;
      program.nextcloud.enable = true;
      # program.obs-studio.enable = true;
      # program.syncthing.enable = true;
      program.yamllint.enable = true;

      shell.fish.enable = true;
      shell.git.enable = true;

      # windowmanager.i3.enable = true;
      # windowmanager.hyprland.enable = true;
      windowmanager.sway.enable = true;
    };

    sops = {
      defaultSopsFile = ./secret.sops.yaml;
      age.keyFile = "${config.home.manager.home.homeDirectory}/.config/sops/age/keys.txt";
    };

    environment.variables.FLAKE = "${config.home.manager.home.homeDirectory}/dotfiles";

    boot = {
      initrd.verbose = false;
      consoleLogLevel = 0;
      kernelParams = [ "quiet" "rd.udev.log_level=3" ];
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
