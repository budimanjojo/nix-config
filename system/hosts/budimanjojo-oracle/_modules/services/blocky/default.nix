{ pkgs, config, ... }:
let
  blockyUser = "blocky";
  configFile = ./config.yaml;
in
{
  # this is enabled by default when `systemd.network.enable` is `true`
  # it listens on port 53 for stub DNS by default so we should just disable it
  services.resolved.enable = false;

  sops.secrets."blocky/env" = {
    sopsFile = ./secret.sops.yaml;
    owner = blockyUser;
    restartUnits = [ "blocky.service" ];
  };

  # add user, needed to access the secret
  users = {
    users.${blockyUser} = {
      isSystemUser = true;
      group = blockyUser;
    };
    groups.${blockyUser} = { };
  };

  systemd.services.blocky = {
    description = "A DNS proxy and ad-blocker for the local network";
    wantedBy = [ "multi-user.target" ];
    # we do `envsubst` to substitute string like ${VAR} using the environment secrets
    preStart = ''
      ${pkgs.envsubst}/bin/envsubst -no-unset -i "${configFile}" -o "$RUNTIME_DIRECTORY/config.yaml"
    '';
    serviceConfig = {
      EnvironmentFile = "${config.sops.secrets."blocky/env".path}";
      User = blockyUser;
      RuntimeDirectory = "blocky";
      ExecStart = "${pkgs.blocky}/bin/blocky --config /run/blocky/config.yaml";
      Restart = "on-failure";
      AmbientCapabilities = [ "CAP_NET_BIND_SERVICE" ];
      CapabilityBoundingSet = [ "CAP_NET_BIND_SERVICE" ];
    };
  };
}
