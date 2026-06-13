{ lib, ... }:
let
  inherit (lib)
    mkOption
    types
    ;
in
{
  baseHostOptions = {
    options = {
      system = mkOption {
        type = types.str;
        default = "x86_64-linux";
      };

      primaryUser = mkOption {
        type = types.str;
        default = "budiman";
      };

      specialArgs = mkOption {
        type = with types; attrsOf anything;
        default = { };
      };

      hardware = mkOption {
        type = types.submodule ({
          options = {
            cpu = mkOption {
              type =
                with types;
                nullOr (enum [
                  "amd"
                  "intel"
                ]);
              default = null;
            };
            gpuDriver = mkOption {
              type =
                with types;
                nullOr (enum [
                  "amd"
                  "intel"
                  "nvidia"
                  "nvidia_legacy_580"
                  "nouveau"
                ]);
              default = null;
            };
            hasSound = mkOption {
              type = types.bool;
              default = false;
            };
            isUEFI = mkOption {
              type = types.bool;
              default = true;
            };
            monitors = mkOption {
              type =
                with types;
                listOf (
                  submodule (
                    { config, ... }:
                    {
                      options = {
                        name = mkOption { type = types.str; };
                        xname = mkOption {
                          type = types.str;
                          default = config.name;
                          description = ''
                            Name of the monitor on X11 session.
                            `xrandr` doesn't use the name reported in `/sys/class/drm, it's also different depending on graphic driver`
                          '';
                        };
                        primary = mkOption {
                          type = types.bool;
                          default = false;
                        };
                        width = mkOption {
                          type = types.int;
                          default = 1920;
                        };
                        height = mkOption {
                          type = types.int;
                          default = 1080;
                        };
                        x = mkOption {
                          type = types.int;
                          default = 0;
                        };
                        y = mkOption {
                          type = types.int;
                          default = 0;
                        };
                        wallpaper = mkOption {
                          type = types.nullOr types.path;
                          default = null;
                        };
                        workspaces = mkOption {
                          type = types.listOf types.int;
                          default = [ ];
                        };
                      };
                    }
                  )
                );
              default = [ ];
            };
          };
        });
        default = { };
      };

      # contains the final package for this configuration
      finalPackage = mkOption {
        type = types.package;
      };

      ghMatrix = mkOption {
        type = types.submodule {
          options = {
            enable = mkOption {
              type = types.bool;
              default = true;
            };
            installable = mkOption {
              type = types.str;
            };
          };
        };
      };
    };
  };

  nixosHomeUserOptions = {
    options.homeUsers = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
  };
}
