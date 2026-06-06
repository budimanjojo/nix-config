{
  flake.modules.nixos.core =
    { primaryUser, ... }:
    {
      time.timeZone = "Asia/Jakarta";

      security = {
        sudo.wheelNeedsPassword = false;
        polkit.enable = true;
      };

      services.displayManager.autoLogin.user = primaryUser;

      catppuccin = {
        flavor = "mocha";
        accent = "mauve";
      };

      documentation.nixos.enable = false;

      # do not change unless you know what you are doing
      system.stateVersion = "23.11";
    };
}
