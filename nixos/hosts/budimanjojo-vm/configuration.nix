{ config, pkgs, ... }:
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
      };

      # All of the available modules are listed below
      # Uncomment/comment do enable/disable module
      browser.firefox.enable = true;

      editor.neovim.enable = true;
      editor.geany.enable = true;

      # homelab.diy-keyboard.enable = true;
      homelab.kubernetes.enable = true;

      # multiplexer.tmux.enable = true;
      # multiplexer.zellij.enable = true;

      # program.adb.enable = true;
      # program.discord.enable = true;
      # program.hugo.enable = true;
      # program.gaming.enable = true;
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
