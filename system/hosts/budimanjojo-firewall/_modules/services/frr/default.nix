{ ... }:
{
  services.frr.bgp = {
    enable = true;
    config = ''
      router bgp 65400
        bgp router-id 192.168.200.1
        no bgp ebgp-requires-policy
        no bgp network import-check
        neighbor 192.168.200.21 remote-as 65401
        neighbor 192.168.200.21 description kmaster1
        neighbor 192.168.200.21 update-source lan0.200
        neighbor 192.168.200.22 remote-as 65401
        neighbor 192.168.200.22 description kmaster2
        neighbor 192.168.200.22 update-source lan0.200
        neighbor 192.168.200.23 remote-as 65401
        neighbor 192.168.200.23 description kmaster3
        neighbor 192.168.200.23 update-source lan0.200
      exit
    '';
  };
}
