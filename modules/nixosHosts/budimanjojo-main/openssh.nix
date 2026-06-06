{ self, ... }:
let
  pubkeys = import "${self}/pubkeys";
in
{
  flake.modules.nixos.budimanjojo-main = {
    mySystem.services.openssh = {
      enable = true;
      authorizedKeys = [
        pubkeys.work-pc
        pubkeys.op9-termux
      ];
    };
  };
}
