{
  inputs,
  withSystem,
  self,
  lib,
  config,
  ...
}:
{
  # `nixosConfigurations` flake output will be automatically generated
  # for each `config.nixosHosts` that we declared
  config.flake.nixosConfigurations =
    let
      mkHost =
        hostname: options:

        inputs.nixpkgs.lib.nixosSystem {
          inherit (options)
            system
            specialArgs
            ;
          # use `pkgs` from `_module.args.pkgs`
          pkgs = withSystem options.system ({ pkgs, ... }: pkgs);

          modules = [
            {
              imports = [
                self.modules.nixos.core
                # autoload modules if defined
                (self.modules.nixos.${hostname} or { })
              ];
              networking.hostName = hostname;
              users.users.${options.primaryUser}.isNormalUser = lib.mkDefault true;
            }

            # per user homeManager modules
            (
              let
                mkPerUserAttr =
                  users: mkValue:
                  builtins.listToAttrs (
                    builtins.map (user: {
                      name = user;
                      value = mkValue user;
                    }) users
                  );
              in
              lib.optionalAttrs (options.homeUsers != [ ]) {
                imports = [ self.modules.nixos.hm-integration ];

                users.users = mkPerUserAttr options.homeUsers (_: {
                  isNormalUser = true;
                });

                home-manager.users = mkPerUserAttr options.homeUsers (user: {
                  imports = [
                    # autoload homeManager modules if defined
                    (self.modules.homeManager.${user} or { })
                    (self.modules.homeManager."${user}@${hostname}" or { })
                    { myHome.username = user; }
                  ];
                });
              }
            )
          ];
        };
    in
    lib.mapAttrs mkHost config.nixosHosts;
}
