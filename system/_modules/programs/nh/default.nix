{
  config,
  lib,
  options,
  ...
}:
let
  cfg = config.mySystem.programs.nh;
  inherit (lib)
    mkEnableOption
    mkOption
    mkMerge
    mkIf
    ;
in
{
  options.mySystem.programs.nh = {
    enable = mkEnableOption "nh Nix CLI helper";
    flake = mkOption {
      type = options.programs.nh.flake.type;
      default = options.programs.nh.flake.default;
    };
  };

  config = mkMerge [
    (mkIf (cfg.enable) {
      programs.nh = {
        enable = true;
        flake = cfg.flake;
        clean = {
          enable = true;
          dates = "weekly";
        };
      };
      programs.fish.shellAbbrs = {
        nos = "git -C $FLAKE pull; nh os switch";
      };
    })
    (mkIf (!cfg.enable) {
      nix.gc = {
        automatic = true;
        dates = "weekly";
      };
    })
  ];
}
