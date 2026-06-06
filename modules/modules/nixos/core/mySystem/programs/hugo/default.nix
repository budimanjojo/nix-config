{
  flake.modules.nixos.core =
    { config, lib, ... }:
    let
      cfg = config.mySystem.programs.hugo;
    in
    {
      options.mySystem.programs.hugo = {
        enable = lib.mkEnableOption "Hugo";
      };
    };
}
