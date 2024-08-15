{ pkgs, ... }:
{
  config = {
    myHome = {
      shell = {
        fish.enable = true;
        lf.enable = true;
      };
      multiplexer.zellij.enable = true;
      browser.firefox.enable = true;
      services.nextcloud-client.enable = true;
      homelab.kubernetes.enable = true;
    };

    programs.go.enable = true;

    home.packages = with pkgs; [
      geany
      libreoffice-fresh
      discord
    ];
  };
}
