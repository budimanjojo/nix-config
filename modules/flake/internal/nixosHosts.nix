{
  lib,
  inputs,
  self,
  ...
}:
let
  inherit (lib)
    types
    mkDefault
    mkOption
    ;
  inherit (import ./_utils { inherit lib; }) baseHostOptions nixosHomeUserOptions;
in
{
  options.nixosHosts =
    let
      nixosHostType = types.submodule [
        baseHostOptions
        nixosHomeUserOptions

        (
          { name, config, ... }:
          {
            finalPackage = mkDefault self.nixosConfigurations.${name}.config.system.build.toplevel;
            specialArgs = {
              inherit inputs;
              inherit (config) primaryUser hardware;
            };
            ghMatrix.installable = mkDefault ".#nixosConfigurations.${name}.config.system.build.toplevel";
          }
        )
      ];
    in
    mkOption {
      type = types.attrsOf nixosHostType;
      default = { };
    };
}
