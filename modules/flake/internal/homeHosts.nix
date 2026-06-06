{
  lib,
  inputs,
  self,
  ...
}:
let
  inherit (lib) types mkDefault mkOption;
  inherit (import ./_utils { inherit lib; }) baseHostOptions;
in
{
  options.homeHosts =
    let
      hostType = types.submodule [
        baseHostOptions

        (
          { name, config, ... }:
          {
            finalPackage = mkDefault self.homeConfigurations."${config.primaryUser}@${name}".activationPackage;
            specialArgs = {
              inherit inputs;
              inherit (config) hardware;
            };
            ghMatrix.installable = mkDefault ".#homeConfigurations.${config.primaryUser}@${name}.activationPackage";
          }
        )
      ];
    in
    mkOption {
      type = types.attrsOf hostType;
      default = { };
    };
}
