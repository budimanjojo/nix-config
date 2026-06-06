{
  flake.modules.nixos.core =
    {
      pkgs,
      config,
      primaryUser,
      ...
    }:
    {
      environment.systemPackages = [
        pkgs.sops
        pkgs.age
      ];
      sops.age = {
        keyFile = "${config.users.users.${primaryUser}.home}/.config/sops/age/keys.txt";
        generateKey = true; # generate the key if it doesn't exist
      };
    };
}
