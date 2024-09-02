{ pkgs, ... }:
{
  config = {
    myHome = {
      programs = {
        chezmoi.enable = true;
        qmk.enable = true;
      };
      multiplexer.zellij.enable = true;
      homelab.kubernetes.enable = true;
      shell.lf.enable = true;
      shell.fish.enable = true;
      terminal-emulator.alacritty.enable = true;
    };

    programs.go.enable = true;
    home.packages = [ pkgs.hugo ];

    # this add nix installed desktop files to be shown in application menu
    targets.genericLinux.enable = true;
    nixGL.prefix = "${pkgs.nixgl.nixGLIntel}/bin/nixGLIntel";
  };
}
