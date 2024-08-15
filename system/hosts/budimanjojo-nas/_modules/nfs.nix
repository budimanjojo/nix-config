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
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /export/Kubernetes-Volumes (fsid=0241f5d9-633f-457a-9f48-dbbbf9d5adcb,rw,subtree_check,insecure,no_root_squash,crossmnt,async)
      /export (ro,fsid=0,root_squash,no_subtree_check,hide)
    '';
  };

  networking.firewall.allowedTCPPorts = [ 2049 ];
}
