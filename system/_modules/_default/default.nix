{
  config,
  hostname,
  pkgs,
  lib,
  ...
}:
let
  mySystem = config.mySystem;
in
{
  imports = [
    ./nix.nix
    ./sops.nix
    ./users.nix
  ];

  config = {
    networking.hostName = hostname;

    time.timeZone = "Asia/Jakarta";

    security = {
      sudo.wheelNeedsPassword = false;
      polkit.enable = true;
    };

    services.displayManager.autoLogin.user = mySystem.adminUser;

    catppuccin = {
      flavor = "mocha";
      accent = "mauve";
    };

    # do not change unless you know what you are doing
    system.stateVersion = "23.11";
    documentation.nixos.enable = false;

    environment.etc."man_db.conf".text =
      let
        cfg = config.documentation.man.man-db;
        buildPackage = cfg.package;
        manualCache =
          pkgs.runCommand "man-cache-test"
            {
              nativeBuildInputs = [ buildPackage ];
            }
            ''
              echo "MANDB_MAP ${cfg.manualPages}/share/man $out" > man.conf
              mandb -C man.conf -psc
            '';
      in
      lib.mkOverride 999 ''
        # Manual pages paths for NixOS
        MANPATH_MAP /run/current-system/sw/bin /run/current-system/sw/share/man
        MANPATH_MAP /run/wrappers/bin          /run/current-system/sw/share/man

        ${lib.optionalString config.documentation.man.generateCaches ''
          # Generated manual pages cache for NixOS (immutable)
          MANDB_MAP /run/current-system/sw/share/man ${manualCache}
        ''}
        # Manual pages caches for NixOS
        MANDB_MAP /run/current-system/sw/share/man /var/cache/man/nixos
      '';
  };
}
