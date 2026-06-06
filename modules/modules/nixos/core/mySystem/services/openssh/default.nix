{
  flake.modules.nixos.core =
    {
      config,
      lib,
      primaryUser,
      ...
    }:
    let
      cfg = config.mySystem.services.openssh;
      inherit (lib)
        mkEnableOption
        mkOption
        types
        mkIf
        ;
    in
    {
      options.mySystem.services.openssh = {
        enable = mkEnableOption "openssh";
        authorizedKeys = mkOption {
          type = types.listOf types.singleLineStr;
          default = [ ];
        };
      };

      config = mkIf (cfg.enable) {
        services.openssh = {
          enable = true;
          settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
          };
        };

        users.users.${primaryUser}.openssh.authorizedKeys.keys = cfg.authorizedKeys;
      };
    };
}
