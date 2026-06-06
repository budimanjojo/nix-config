{
  flake.modules.homeManager.budiman =
    { lib, config, ... }:
    {
      myHome.shell.git = {
        enable = true;
        config = {
          commit = {
            template = "${./gitcommit-message}";
            gpgSign = true;
          };
          user = {
            name = "budimanjojo";
            email = "budimanjojo@gmail.com";
            signingKey = "${config.home.homeDirectory}/.ssh/id_rsa.pub";
          };
          gpg.format = "ssh";
        };
      };
    };
}
