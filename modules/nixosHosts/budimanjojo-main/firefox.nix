{
  flake.modules.homeManager."budiman@budimanjojo-main" =
    { pkgs, ... }:
    {
      myHome.browser.firefox.profiles = {
        budiman = {
          id = 0;
          name = "budiman";
          isDefault = true;
          extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            tokyo-night-v2
          ];
        };
        lina = {
          id = 1;
          name = "lina";
          isDefault = false;
          extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            tokyo-night-v2
          ];
        };
      };
    };
}
