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
    # see: https://github.com/AdguardTeam/AdGuardHome/issues/4880
    wants = [ "time-sync.target" ];
    after = [ "time-sync.target" ];
    serviceConfig = {
      EnvironmentFile = "${config.sops.secrets."adguardhome/env".path}";
      User = adguardUser;
    };
    # we do `envsubst` to substitute string like ${VAR} using the environment secrets
    # and also `bcrypt` the substituted unencrypted password with `htpasswd` as per config requirement
    preStart = lib.mkAfter ''
      ${pkgs.envsubst}/bin/envsubst -no-unset -i "$STATE_DIRECTORY/AdGuardHome.yaml" -o "$STATE_DIRECTORY/AdGuardHome.yaml"

      PASSWORD=$(cat ${config.sops.secrets."adguardhome/password".path})
      HASHED_PASSWORD=$(${pkgs.apacheHttpd}/bin/htpasswd -nbB "" $PASSWORD | cut -c 2-)
      ${pkgs.gnused}/bin/sed -i "s,ADGUARDHOMEPASSWORD,$HASHED_PASSWORD," "$STATE_DIRECTORY/AdGuardHome.yaml"
    '';
  };

  services.adguardhome = {
    enable = true;
    host = "192.168.10.1";
    port = 3000;
    mutableSettings = true;
    settings = {
      schema_version = 29; # the default is pkgs.adguardhome.schema_version
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
          "[/internal.\${SECRET_DOMAIN_1}/]192.168.10.1"
          "[/external.\${SECRET_DOMAIN_1}/]192.168.10.1"
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
      };
      tls.enabled = false;
      querylog = {
        interval = "168h";
        enabled = true;
      };
      statistics = {
        enabled = true;
        interval = "24h";
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
            uid = "2e755b04-5463-4f69-93a2-6d620f42c6e1";
            tags = [ ];
            ids = [ "192.168.250.0/24" ];
            use_global_settings = true;
            use_global_blocked_services = true;
            blocked_services.ids = [ ];
            upstreams = [ "tls://one.one.one.one" ];
          }
          {
            name = "IOT";
            uid = "7a8b3ec5-5915-4bdc-b368-92c1c123bfb1";
            tags = [ ];
            ids = [ "192.168.69.0/24" ];
            use_global_settings = false;
            use_global_blocked_services = true;
            blocked_services.ids = [ ];
            upstreams = [
              "1.1.1.1"
              "8.8.8.8"
            ];
          }
          {
            name = "Android TV";
            uid = "3635575c-a9bb-4303-a2e2-75ffd1d0a967";
            tags = [ "device_tv" ];
            ids = [ "192.168.69.30" ];
            use_global_settings = true;
            use_global_blocked_services = true;
            blocked_services.ids = [ ];
            upstreams = [ "tls://one.one.one.one" ];
          }
          {
            name = "Children";
            uid = "27337a9f-d874-497c-9037-39519f1384a5";
            tags = [ "user_child" ];
            ids = [
              "192.168.10.12"
              "192.168.10.13"
              "10.10.0.4"
            ];
            use_global_settings = false;
            blocked_services.ids = [
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
            safebrowsing_enabled = true;
          }
        ];
      };
    };
  };
}
