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
      shell.starship.enable = true;
    };

    programs.go.enable = true;
    home.packages = [ pkgs.hugo ];
  };
}
