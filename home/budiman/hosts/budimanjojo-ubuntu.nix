{ pkgs, inputs, ... }:
{
  config = {
    myHome = {
      programs = {
        chezmoi.enable = true;
        go.enable = true;
        qmk.enable = true;
      };
      multiplexer.tmux.enable = true;
      homelab.kubernetes.enable = true;
      shell.lf.enable = true;
      shell.fish.enable = true;
      terminal-emulator.contour.enable = true;
      terminal-emulator.alacritty.enable = true;
    };

    home.packages = [ pkgs.hugo ];

    # this add nix installed desktop files to be shown in application menu
    targets.genericLinux.enable = true;
    nixGL.packages = inputs.nixgl.packages;
  };
}
