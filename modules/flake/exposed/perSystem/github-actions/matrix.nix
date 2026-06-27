{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption types;

  bootstrapOption = mkOption {
    type = types.attrsOf (types.listOf types.anything);
    internal = true;
    readOnly = true;
  };

  runners = {
    x86_64-linux = "ubuntu-24.04";
    aarch64-linux = "ubuntu-24.04-arm";
    x86_64-darwin = "macos-13";
    aarch64-darwin = "macos-14";
  };

  mkPerHostMatrix =
    hosts:
    let
      filterAttr = attr: lib.filterAttrs (n: v: v.ghMatrix.enable) attr;
      matrixSet = name: cfg: {
        attrset = cfg.ghMatrix.installable;
        runner = runners.${cfg.system};
        system = cfg.system;
      };
    in
    lib.mapAttrsToList matrixSet (filterAttr hosts);
in
{
  options = {
    # this creates matrix that map host to suitable GitHub runner
    perHostMatrix = bootstrapOption;
    # the same but per system
    perSystemMatrix = bootstrapOption;
  };

  config = {
    perHostMatrix.include = mkPerHostMatrix (config.nixosHosts // config.homeHosts);
    perSystemMatrix.include = builtins.map (system: {
      system = system;
      runner = runners.${system};
    }) config.systems;
  };
}
