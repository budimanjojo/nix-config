{ ... }:
{
  virtualisation = {
    containers.enable = true;
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      defaultNetwork.settings = {
        dns_enabled = true;
        subnets = [
          {
            network_interface = "ctr0";
            subnet = "10.5.0.0/24";
            gateway = "10.5.0.1";
            lease_range = {
              start_ip = "10.5.0.50";
              end_ip = "10.5.0.200";
            };
          }
        ];
      };
    };
  };
}
