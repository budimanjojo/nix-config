{ ... }:
let
  pubkeys = import ../pubkeys;
in
{
  config = {
    mySystem = {
      system.autoupgrade.enable = true;
      services.openssh = {
        enable = true;
        authorizedKeys = [
          pubkeys.work-pc
          pubkeys.main-pc
          pubkeys.op9-termux
        ];
      };
      monitoring = {
        node-exporter.enable = true;
        smartctl-exporter.enable = true;
      };
    };
  };
}
