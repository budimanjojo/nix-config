{ ... }:
{
  fileSystems = {
    "/export/Kubernetes-Volumes" = {
      device = "/nas-data/Kubernetes-Volumes";
      options = [
        "bind"
        "nfsvers=4.2"
        "nofail"
      ];
    };
    "/export/Media" = {
      device = "/nas-data/Media";
      options = [
        "bind"
        "nfsvers=4.2"
        "nofail"
      ];
    };
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /export/Media *(fsid=aa341bb8-719d-4700-96f2-40f33abfefad,rw,no_subtree_check,insecure,no_root_squash,crossmnt,async)
      /export/Kubernetes-Volumes *(fsid=0241f5d9-633f-457a-9f48-dbbbf9d5adcb,rw,no_subtree_check,insecure,no_root_squash,crossmnt,async)
      /export *(ro,fsid=0,root_squash,no_subtree_check,hide)
    '';
  };

  networking.firewall.allowedTCPPorts = [ 2049 ];
}
