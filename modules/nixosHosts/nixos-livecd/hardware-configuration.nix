{
  flake.modules.nixos.nixos-livecd =
    { modulesPath, ... }:
    {
      imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
    };
}
