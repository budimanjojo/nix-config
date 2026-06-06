{
  flake.modules.homeManager.core =
    { config, ... }:
    {
      home = {
        username = config.myHome.username;
        homeDirectory = "/home/" + config.myHome.username;
        stateVersion = "23.11";
      };

      programs.home-manager.enable = true;
    };
}
