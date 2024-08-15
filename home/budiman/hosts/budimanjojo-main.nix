{ pkgs, ... }:
{
  imports = [
    ../profiles/workstation-hyprland.nix
    ../profiles/extra-gaming.nix
    ../profiles/extra-graphics.nix
    ../profiles/extra-utilities.nix
  ];

  config = {
    myHome = {
      browser.firefox.profiles = {
        "budiman" = {
          id = 0;
          name = "budiman";
          isDefault = true;
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            tokyo-night-v2
          ];
        };
        "lina" = {
          id = 1;
          name = "lina";
          isDefault = false;
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            tokyo-night-v2
          ];
        };
      };
      programs.qmk.enable = true;
    };

    home.packages = [ pkgs.hugo ];
  };
}
