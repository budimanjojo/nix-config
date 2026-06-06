{ self, ... }:
{
  nixosHosts.nixos-livecd = {
    system = "x86_64-linux";
    primaryUser = "nixos";
    finalPackage = self.nixosConfigurations.nixos-livecd.config.system.build.isoImage;
    ghMatrix.enable = false;
  };

  flake.modules.nixos.nixos-livecd =
    { pkgs, ... }:
    let
      pubkeys = import "${self}/pubkeys";
    in
    {
      # faster build time
      isoImage.squashfsCompression = "gzip -Xcompression-level 1";

      # enable SSH in the boot process
      systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
      users.users.nixos.openssh.authorizedKeys.keys = [ pubkeys.main-pc ];

      environment.systemPackages = [
        pkgs.thisflake.neovim
        pkgs.gitMinimal
      ];
    };
}
