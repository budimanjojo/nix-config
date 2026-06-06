{
  lib,
  inputs,
  config,
  withSystem,
  self,
  ...
}:
{
  # we use `flake` instead of `perSystem` because we want to check for specific system
  # each host is targeted for specific system and there's no point to check for all systems
  flake.checks =
    let
      mkHostChecksForSystem =
        system: hosts:
        let
          hostForSystem = lib.filterAttrs (_: cfg: cfg.system == system) hosts;
        in
        lib.mapAttrs' (name: cfg: lib.nameValuePair "${name}-check" cfg.finalPackage) hostForSystem;

      mkNixvimCheckForSystem = system: {
        nixvim = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule {
          pkgs = withSystem system ({ pkgs, ... }: pkgs);
          module.imports = [ self.modules.generic.nixvim ];
        };
      };
    in
    lib.genAttrs config.systems (
      system:
      # we skip nixosHosts because it's already being checked by default
      # TODO: find a way to mimic nixosConfigurations where it only evaluate instead of building
      # the entire package because we want to make CI run to be more efficient
      (mkHostChecksForSystem system config.homeHosts) // (mkNixvimCheckForSystem system)
    );
}
