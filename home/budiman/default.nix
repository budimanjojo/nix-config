{
  hostname,
  myPkgs,
  config,
  ...
}:
{
  # host specific config
  imports = [ ./hosts/${hostname}.nix ];

  # global config applied to all hosts
  config = {
    myHome = {
      editor.neovim = {
        enable = true;
        package = myPkgs.neovim;
      };

      shell.git = {
        enable = true;
        config = {
          commit = {
            template = "${./config/gitcommit-message}";
            gpgSign = true;
          };
          user = {
            name = "budimanjojo";
            email = "budimanjojo@gmail.com";
            signingKey = "${config.home.homeDirectory}/.ssh/id_rsa.pub";
          };
          gpg = {
            format = "ssh";
          };
        };
      };
    };
  };
}
