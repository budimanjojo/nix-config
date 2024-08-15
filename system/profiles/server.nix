{ ... }:
let
  pubkeys = import ../pubkeys;
in
{
  config = {
    mySystem = {
      services.smartd.enable = true;
      system.autoupgrade.enable = true;
      services.openssh = {
        enable = true;
        authorizedKeys = [
          pubkeys.work-pc
          pubkeys.main-pc
          pubkeys.op9-termux
        ];
      };

    };
  };
}
