{
  flake.modules.nixos.budimanjojo-main = {
    mySystem.programs.nh = {
      enable = true;
      flake = "/home/budiman/Github/nix-config";
    };
  };
}
