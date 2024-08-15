{ config, hostname, ... }:
let
  mySystem = config.mySystem;
in
{
  imports = [
    ./nix.nix
    ./sops.nix
    ./users.nix
  ];

  config = {
    networking.hostName = hostname;

    time.timeZone = "Asia/Jakarta";

    security = {
      sudo.wheelNeedsPassword = false;
      polkit.enable = true;
    };

    services.displayManager.autoLogin.user = mySystem.adminUser;

    # do not change unless you know what you are doing
    system.stateVersion = "23.11";
    documentation.nixos.enable = false;
  };
}
