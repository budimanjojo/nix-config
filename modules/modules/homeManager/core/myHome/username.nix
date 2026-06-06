{
  flake.modules.homeManager.core =
    { lib, ... }:
    {
      # this should be filled automatically
      # shouldn't be configured manually
      options.myHome.username = lib.mkOption {
        type = lib.types.str;
        default = "";
        internal = true;
      };
    };
}
