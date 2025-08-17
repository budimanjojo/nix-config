{ ... }:
{
  networking = {
    firewall.enable = false;
    nat.enable = false;
    nftables = {
      enable = true;
      flushRuleset = true;
      tables = {
        main_filter = {
          family = "inet";
          content = ''
            chain INPUT {
              type nat hook input priority filter; policy drop;
              ct state vmap {
                established : accept, related : accept,
                invalid : drop
              }
              iifname lo accept comment "allow loopback traffic"

              # FROM OUTSIDE
              iifname enp0s6 udp dport 51821 counter accept comment "allow access to WireGuard"
              iifname enp0s6 tcp dport 22 counter accept comment "allow access to SSH"

              # FROM WIREGUARD
              iifname wg0 tcp dport 22 counter accept comment "allow access to SSH"
              iifname wg0 ip saddr 10.10.10.0/24 counter accept comment "allow access from own CIDR"
            }
          '';
        };
      };
    };
  };
}
