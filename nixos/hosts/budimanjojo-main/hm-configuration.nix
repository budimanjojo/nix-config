{ config,  ... }:
{
  config = {
    hm-modules = {
      # All of the available modules are listed below
      # Uncomment/comment do enable/disable module
      browser.firefox.enable = true;

      editor.neovim.enable = true;
      editor.geany.enable = true;

      homelab.diy-keyboard.enable = true;
      homelab.kubernetes.enable = true;

      # multiplexer.tmux.enable = true;
      multiplexer.zellij.enable = true;

      program.discord.enable = true;
      program.hugo.enable = true;
      program.gaming.enable = true;
      program.go.enable = true;
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

      windowmanager.hyprland.enable = true;
      # windowmanager.i3.enable = true;
      # windowmanager.sway.enable = true;
    };
  };
}
