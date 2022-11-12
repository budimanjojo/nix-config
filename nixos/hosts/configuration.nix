{ config, pkgs, inputs, ... }:
let
  deviceCfg = config.modules.device;
in {
  users.users.${deviceCfg.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = pkgs.fish;
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
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  nixpkgs.config.allowUnfree = true;
  system = {
    autoUpgrade = {
      enable = true;
      flake = builtins.toString ../../.;
    };
    stateVersion = "22.05";
  };

  home.manager = {
    home = {
      username = deviceCfg.username;
      homeDirectory = "/home/" + deviceCfg.username;

      stateVersion = "22.05";
    };

    programs = {
      home-manager.enable = true;
    };
  };
}
