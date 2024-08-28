{ config, ... }:
let
  myHome = config.myHome;
in
{
  imports = [
    ./nix.nix
    ./sops.nix
  ];

  config = {
    home = {
      username = myHome.username;
      homeDirectory = "/home/" + myHome.username;
      stateVersion = "23.11";
    };

    programs.home-manager.enable = true;

    catppuccin = {
      flavor = "mocha";
      accent = "mauve";
    };
  };
}
