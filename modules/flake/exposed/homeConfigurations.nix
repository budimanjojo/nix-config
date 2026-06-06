{
  lib,
  config,
  inputs,
  withSystem,
  self,
  ...
}:
{
  # `homeConfigurations` flake output will be automatically generated
  # for each `config.homeHosts` that we declared
  # TODO: haven't figured out a good way to support multi user host yet
  config.flake.homeConfigurations =
    let
      mkHost =
        hostname: options:

        (lib.nameValuePair (options.primaryUser + "@" + hostname) (
          inputs.home-manager.lib.homeManagerConfiguration {
            extraSpecialArgs = options.specialArgs;
            # use `pkgs` from `_module.args.pkgs`
            pkgs = withSystem options.system ({ pkgs, ... }: pkgs);

            modules = [
              {
                imports = [
                  self.modules.homeManager.core
                  # autoload modules if defined
                  (self.modules.homeManager.${options.primaryUser} or { })
                  (self.modules.homeManager."${options.primaryUser}@${hostname}" or { })
                ];
                myHome.username = options.primaryUser;
              }
            ];
          }
        ));
    in
    lib.mapAttrs' mkHost config.homeHosts;
}
