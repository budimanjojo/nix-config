{
  flake.modules.nixos.core =
    {
      config,
      lib,
      pkgs,
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
        environment.systemPackages = [ pkgs.android-tools ];
      };
    };
}
