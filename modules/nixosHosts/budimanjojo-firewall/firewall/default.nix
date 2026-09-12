{
  flake.modules.nixos.budimanjojo-firewall =
    let
      interfaces = [
        {
          name = "LAN0";
          iface = "lan0";
          network = "192.168.10.0/24";
        }
        {
          name = "HOME";
          iface = "lan0.50";
          network = "192.168.50.0/24";
        }
        {
          name = "IOT";
          iface = "lan0.69";
          network = "192.168.69.0/24";
        }
        {
          name = "SERVER";
          iface = "lan0.200";
          network = "192.168.200.0/24";
        }
        {
          name = "GUEST";
          iface = "lan0.250";
          network = "192.168.250.0/24";
        }
        {
          name = "CONTAINERS";
          iface = "ctr0";
          network = "";
        }
        {
          name = "WIREGUARD";
          iface = "wg0";
          network = "10.10.10.0/24";
        }
        {
          name = "WAN";
          iface = "wan0";
          network = "";
        }
      ];
    in
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
                  iifname {
                    lan0.69, lan0.250
                  } meta l4proto { tcp, udp } th dport 53 ip daddr != 192.168.10.1 counter dnat to 192.168.10.1:53 comment "force DNS for IOT and GUEST VLAN"
                  iifname {
                    lan0, lan0.50, lan0.69, lan0.200, lan0.250, wg0
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
                ${builtins.concatStringsSep "" (
                  builtins.map (iface: ''
                    ${
                      if (iface.network != "") then
                        ''
                          set ${iface.name}_NET {
                            type ipv4_addr
                            flags interval
                            elements = { ${iface.network} }
                          }
                        ''
                      else
                        ""
                    }
                    set ${iface.name}_IF {
                      type ifname
                      elements = { ${iface.iface} }
                    }
                  '') interfaces
                )}

                ${builtins.readFile ./_config/sets.nft}
                ${builtins.readFile ./_config/rules.nft}
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
    };
}
