{ ... }:
{
  services.chrony = {
    enable = true;
    servers = [ "id.pool.ntp.org" ];
    serverOption = "iburst";
    extraConfig = ''
      allow 127.0.0.0/8
      allow 10.0.0.0/8
      allow 172.16.0.0/12
      allow 192.168.0.0/16
    '';
  };
}
