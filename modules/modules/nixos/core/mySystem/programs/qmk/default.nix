{
  flake.modules.nixos.core =
    {
      config,
      lib,
      primaryUser,
      ...
    }:
    let
      cfg = config.mySystem.programs.qmk;
    in
    {
      options.mySystem.programs.qmk = {
        enable = lib.mkEnableOption "QMK";
      };

      config = lib.mkIf (cfg.enable) {
        # needed for qmk udev rule
        users = {
          groups.plugdev = { };
          users.${primaryUser}.extraGroups = [ "plugdev" ];
        };
        hardware.keyboard.qmk.enable = true;
      };
    };
}
