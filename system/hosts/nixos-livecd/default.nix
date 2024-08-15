{
  modulesPath,
  pkgs,
  myPkgs,
  hostname,
  ...
}:
let
  pubkeys = import ../../pubkeys;
in
{
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];

  config = {
    # faster build time
    isoImage.squashfsCompression = "gzip -Xcompression-level 1";

    # enable SSH in the boot process
    systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
    users.users.nixos.openssh.authorizedKeys.keys = [ pubkeys.main-pc ];

    environment.systemPackages = [
      myPkgs.neovim
      pkgs.gitMinimal
    ];

    networking.hostName = hostname;

    time.timeZone = "Asia/Jakarta";

    security = {
      sudo.wheelNeedsPassword = false;
    };
  };
}
