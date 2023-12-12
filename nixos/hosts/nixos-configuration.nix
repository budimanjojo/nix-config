{ config, pkgs, inputs, ... }:
let
  deviceCfg = config.deviceCfg;
in {
  sops.secrets.budiman-password = {
    sopsFile = ./secret.sops.yaml;
    neededForUsers = true;
  };

  users.mutableUsers = false;
  users.users.${deviceCfg.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = pkgs.fish;
    hashedPasswordFile = config.sops.secrets.budiman-password.path;
  };

  # Autologin
  services.getty.autologinUser = deviceCfg.username;
  services.greetd.settings.initial_session.user = deviceCfg.username;
  services.greetd.settings.default_session.user = deviceCfg.username;
  services.xserver.displayManager.autoLogin.user = deviceCfg.username;

  networking.hostName = deviceCfg.hostname;

  time.timeZone = "Asia/Jakarta";

  security = {
    sudo.wheelNeedsPassword = false;
    polkit.enable = true;
  };

  # Programs that should always be needed
  modules.program.tui-utils.enable = true;

  nix = {
    settings = {
      substituters = [
        "https://hyprland.cachix.org"
        "https://viperml.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "viperml.cachix.org-1:qZhKBMTfmcLL+OG6fj/hzsMEedgKvZVFRRAhq7j8Vh8="
      ];
      auto-optimise-store = true;
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  system = {
    autoUpgrade = {
      enable = false;
      flake = builtins.toString ../../.;
    };
    stateVersion = "23.11";
  };

  documentation.nixos.enable = false;
}
