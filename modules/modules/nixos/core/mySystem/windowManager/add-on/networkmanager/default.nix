{
  flake.modules.nixos.core =
    {
      config,
      lib,
      primaryUser,
      ...
    }:
    let
      cfg = config.mySystem.windowManager.add-on.networkmanager;
    in
    {
      options.mySystem.windowManager.add-on.networkmanager = {
        enable = lib.mkEnableOption "Network Manager";
      };

      config = lib.mkIf (cfg.enable) {
        networking.networkmanager.enable = true;
        users.users.${primaryUser}.extraGroups = [ "networkmanager" ];
      };
    };
}
