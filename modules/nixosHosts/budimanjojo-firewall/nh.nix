{
  flake.modules.nixos.budimanjojo-firewall = {
    mySystem.programs.nh = {
      enable = true;
      flake = "/home/budiman/Github/nix-config";
    };
  };
}
