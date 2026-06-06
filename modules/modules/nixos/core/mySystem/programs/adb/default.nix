{
  flake.modules.nixos.core =
    {
      config,
      lib,
      primaryUser,
      ...
    }:
    let
      cfg = config.mySystem.programs.adb;
    in
    {
      options.mySystem.programs.adb = {
        enable = lib.mkEnableOption "adb";
      };

      config = lib.mkIf (cfg.enable) {
        programs.adb.enable = true;
        users.users.${primaryUser}.extraGroups = [ "adbusers" ];
      };
    };
}
