{
  flake.modules.homeManager.core =
    { lib, ... }:
    {
      # this should be flipped automatically by Wayland services
      # shouldn't be enabled manually
      options.myHome.isWayland = lib.mkOption {
        type = lib.types.bool;
        default = false;
        internal = true;
      };
    };
}
