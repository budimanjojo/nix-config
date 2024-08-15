{ hostname, pkgs, ... }:
{
  # host specific config
  imports = [ ./${hostname} ];

  # global config applied to all hosts
  config = {
    environment.systemPackages = with pkgs; [
      dig
      htop
      tree
      usbutils
    ];
  };
}
