{
  lib,
  config,
  ...
}:
let
  runners = {
    x86_64-linux = "ubuntu-24.04";
    aarch64-linux = "ubuntu-24.04-arm";
    x86_64-darwin = "macos-13";
    aarch64-darwin = "macos-14";
  };
  mkMatrix =
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
  flake.ghActions = {
    # this is used to make GitHub Actions matrix
    # i.e `nix eval --json '.#ghActions.perHostMatrix'` in a job step
    perHostMatrix.include = mkMatrix (config.nixosHosts // config.homeHosts);
    perSystemMatrix.include = builtins.map (system: {
      system = system;
      runner = runners.${system};
    }) config.systems;
  };
}
