{ ... }:
{
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv6.conf.all.forwarding" = false;
  };
  networking = {
    firewall.enable = false;
    nat.enable = false;
    nftables = {
      enable = true;
      flushRuleset = true;
      tables = {
        home_nat = {
          family = "ip";
          content = ''
            chain PREROUTING {
              type nat hook prerouting priority dstnat; policy accept;
              iifname "wan0" meta l4proto { tcp, udp } th dport 50413 counter dnat to 192.168.15.10 comment "port forward 50413 to qBittorrent"
              iifname {
                lan0.69, lan0.250
              } meta l4proto { tcp, udp } th dport 53 ip daddr != 192.168.10.1 counter dnat to 192.168.10.1:53 comment "force DNS for IOT and GUEST VLAN"
              iifname {
                lan0, lan0.50, lan0.69, lan0.200, lan0,250, wg0
              } udp dport 123 ip daddr != 192.168.10.1 counter dnat to 192.168.10.1:123 comment "force NTP for all interfaces"
            }
            chain POSTROUTING {
              type nat hook postrouting priority srcnat; policy accept;
              oifname "wan0" ip daddr 0.0.0.0/0 counter masquerade comment "outbound will use the public IP so I can browse internet"
            }
          '';
        };
        home_ip_filter = {
          family = "ip";
          content = ''
            chain STATE_POLICY {
              ct state established counter accept
              ct state related counter accept
              return
            }

            ${builtins.readFile ./config/sets.nft}
            ${builtins.readFile ./config/zone-rules.nft}
            ${builtins.readFile ./config/zone-directions.nft}
          '';
        };
        home_ip6_filter = {
          family = "ip6";
          content = ''
            chain STATE_POLICY {
              ct state established counter accept
              ct state related counter accept
              return
            }

            chain ZONE_INPUT {
              type filter hook input priority filter + 1; policy accept;
              jump STATE_POLICY
              iifname "lo" counter return
              counter drop comment "default-action drop"
            }

            # ZONE_FORWARD is disabled for ipv6 in sysctl above

            chain ZONE_OUTPUT {
              type filter hook output priority filter + 1; policy accept;
              jump STATE_POLICY
              oifname "lo" counter return
              counter drop comment "default-action drop"
            }
          '';
        };
      };
    };
  };
}
