{
  config,
  lib,
  pkgs,
  ...
}:
let
  adguardUser = "adguardhome";
in
{
  sops.secrets = {
    "adguardhome/password" = {
      sopsFile = ./secret.sops.yaml;
      owner = adguardUser;
      restartUnits = [ "adguardhome.service" ];
    };
    "adguardhome/env" = {
      sopsFile = ./secret.sops.yaml;
      owner = adguardUser;
      restartUnits = [ "adguardhome.service" ];
    };
  };

  # add user, needed to access the secret
  users = {
    users.${adguardUser} = {
      isSystemUser = true;
      group = adguardUser;
    };
    groups.${adguardUser} = { };
  };

  systemd.services.adguardhome = {
    serviceConfig = {
      EnvironmentFile = "${config.sops.secrets."adguardhome/env".path}";
      User = adguardUser;
    };
    # we do `envsubst` to substitute string like ${VAR} using the environment secrets
    # and also `bcrypt` the substituted unencrypted password with `htpasswd` as per config requirement
    preStart = lib.mkAfter ''
      ${pkgs.envsubst}/bin/envsubst -no-unset -i "$STATE_DIRECTORY/AdGuardHome.yaml" -o "$STATE_DIRECTORY/AdGuardHome.yaml"

      PASSWORD=$(cat ${config.sops.secrets."adguardhome/password".path})
      HASHED_PASSWORD=$(${pkgs.apacheHttpd}/bin/htpasswd -niB "" | cut -c 2-)
      ${pkgs.gnused}/bin/sed -i "s,ADGUARDHOMEPASSWORD,$HASHED_PASSWORD," "$STATE_DIRECTORY/AdGuardHome.yaml"
    '';
  };

  services.adguardhome = {
    enable = true;
    host = "192.168.10.1";
    port = 3000;
    mutableSettings = false;
    settings = {
      schema_version = 28; # the default is pkgs.adguardhome.schema_version
      users = [
        {
          name = "budiman";
          password = "ADGUARDHOMEPASSWORD"; # placeholder
        }
      ];
      auth_attempts = 5;
      block_auth_min = 15;
      theme = "auto";
      http = {
        pprof.enabled = false;
        session_ttl = "720h";
      };
      dhcp.enabled = false;
      dns = {
        bind_hosts = [ "192.168.10.1" ];
        port = 53;
        anonymize_client_ip = false;
        ratelimit = 20;
        refuse_any = true;
        upstream_dns = [
          "[/home.arpa/]192.168.10.1:8853"
          "tls://one.one.one.one"
        ];
        bootstrap_dns = [
          "1.1.1.1"
          "8.8.8.8"
          "2606:4700:4700::1111"
          "2001:4860:4860::8888"
        ];
        upstream_mode = "parallel";
        blocked_hosts = [
          "version.bind"
          "id.server"
          "hostname.bind"
        ];
        trusted_proxies = [
          "127.0.0.0/8"
          "::1/128"
        ];
        enable_dnssec = true;
        edns_client_subnet = {
          custom_ip = "";
          enabled = true;
          use_custom = false;
        };
        handle_ddr = true;
        use_private_ptr_resolvers = true;
        local_ptr_upstreams = [ "192.168.10.1:8853" ];
      };
      filtering = {
        blocking_mode = "default";
        protection_enabled = true;
        safe_search.enabled = false;
        safebrowsing_enabled = true;
        parental_enabled = false;
        filtering_enabled = true;
        filters_update_interval = 24;
        rewrites = [
          {
            domain = "\${SECRET_DOMAIN_0}";
            answer = "192.168.15.0";
          }
          {
            domain = "*.\${SECRET_DOMAIN_0}";
            answer = "192.168.15.0";
          }
          {
            domain = "\${SECRET_DOMAIN_1}";
            answer = "192.168.15.0";
          }
          {
            domain = "\${SECRET_WIREGUARD_ENTRYPOINT}";
            answer = "\${SECRET_WIREGUARD_ENTRYPOINT}";
          }
          {
            domain = "vault.\${SECRET_DOMAIN_0}";
            answer = "vault.\${SECRET_DOMAIN_0}";
          }
          {
            domain = "oracle.\${SECRET_DOMAIN_0}";
            answer = "\${SECRET_DOMAIN_0}";
          }
        ];
      };
      tls.enabled = false;
      querylog = {
        interval = "168h";
        enabled = true;
      };
      statistics = {
        interval = "24h";
        enabled = true;
      };
      filters =
        let
          urls = [
            {
              name = "AdGuard DNS filter";
              url = "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt";
            }
            {
              name = "IDN: ABPindo";
              url = "https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/abpindo.txt";
            }
            {
              name = "GoodbyAds";
              url = "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt";
            }
          ];
          buildList = id: url: {
            enabled = true;
            inherit id;
            inherit (url) name url;
          };
        in
        lib.imap1 buildList urls;
      user_rules = [
        "@@||s2.youtube.com^"
        "@@||graph.facebook.com^"
        "@@||i.instagram.com^"
        "@@||fonts.gstatic.com^"
        "@@||click.redditmail.com^"
        "@@||aypbpr.tokopedia.com^"
        "@@||plenty.vidio.com^"
        "@@||i.sgsnssdk.com^"
      ];
      clients = {
        runtime_sources = {
          whois = true;
          arp = true;
          rdns = true;
          dhcp = true;
          hosts = true;
        };
        persistent = [
          {
            name = "GUEST";
            tags = [ ];
            ids = [ "192.168.250.0/24" ];
            use_global_settings = true;
            upstreams = [ "tls://one.one.one.one" ];
          }
          {
            name = "IOT";
            tags = [ ];
            ids = [ "192.168.69.0/24" ];
            use_global_settings = false;
            upstreams = [
              "1.1.1.1"
              "8.8.8.8"
            ];
          }
          {
            name = "Android TV";
            tags = [ "device_tv" ];
            ids = [ "192.168.50.41" ];
            use_global_settings = false;
            upstreams = [
              "1.1.1.1"
              "8.8.8.8"
            ];
          }
          {
            name = "Children";
            tags = [ "user_child" ];
            ids = [
              "192.168.10.12"
              "192.168.10.13"
              "10.10.0.4"
            ];
            use_global_settings = false;
            blocked_services = [
              "reddit"
              "tiktok"
              "facebook"
              "instagram"
              "snapchat"
              "tinder"
            ];
            upstreams = [ ];
            safe_search = {
              enabled = true;
              bing = true;
              duckduckgo = true;
              google = true;
              pixabay = true;
              yandex = true;
              youtube = true;
            };
            filtering_enabled = true;
            parental_enabled = true;
            use_global_blocked_services = false;
            ignore_querylog = false;
            ignore_statistics = false;
          }
        ];
      };
    };
  };
}
