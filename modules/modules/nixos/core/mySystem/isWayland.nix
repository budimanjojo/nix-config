{
  flake.modules.nixos.core =
    { lib, ... }:
    {
      # this should be flipped automatically by Wayland services
      # shouldn't be enabled manually
      options.mySystem.isWayland = lib.mkOption {
        type = lib.types.bool;
        default = false;
        internal = true;
      };
    };
}
