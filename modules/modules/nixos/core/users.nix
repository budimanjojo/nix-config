{
  flake.modules.nixos.core =
    { primaryUser, pkgs, ... }:
    {
      users = {
        mutableUsers = false;
        users.${primaryUser} = {
          isNormalUser = true;
          uid = 1000;
          extraGroups = [ "wheel" ];
          shell = pkgs.fish;
          hashedPassword = "$y$j9T$X4WW5d9o5AhokGSdmgDQz/$ISPqt42BCoGQHX4RFF1CzBWJb2mLP5f6Xmu44gu0vsD";
        };
      };

      programs.fish.enable = true;
    };
}
