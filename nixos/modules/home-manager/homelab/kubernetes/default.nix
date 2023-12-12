{ lib, config, pkgs, myPkgs, ... }:

with lib;
let
  cfg = config.hm-modules.homelab.kubernetes;
in {
  options.hm-modules.homelab.kubernetes = { enable = mkEnableOption "kubernetes"; };
  config = mkIf cfg.enable {
    hm-modules.shell.git.enable = true;
    hm-modules.shell.nix-direnv.enable = true;

    sops = {
      secrets = {
        kubeconfig = {
          sopsFile = ./secret.sops.yaml;
          path = "${config.home.homeDirectory}/.kube/config";
        };
        talosconfig = {
          sopsFile = ./secret.sops.yaml;
          path = "${config.home.homeDirectory}/.talos/config";
        };
      };

    };

    xdg.configFile."k9s".source = ./k9s;

    programs.fish = {
      shellAbbrs = {
        # kubectl
        k = {
          position = "anywhere";
          expansion = "kubectl";
        };
        # kgp = "kubectl get pods";
        kgp = {
          position = "anywhere";
          expansion = "kubectl get pods";
        };
        kgn = {
          position = "anywhere";
          expansion = "kubectl get nodes";
        };
        kl = "kubectl logs";
        kdp = "kubectl describe pod";
        kdn = "kubectl describe node";
        kx = "kubectl exec -it";

        # flux
        f = {
          position = "anywhere";
          expansion = "flux";
        };
        fgk = {
          position = "anywhere";
          expansion = "flux get ks";
        };
        fsa = "flux suspend kustomization --all";
        fra = "flux resume kustomization --all";

        # talosctl
        t = "talosctl";

        # talhelper
        th = "talhelper";

        # k9s
        ks = "k9s";
      };
    };

    home.packages = with pkgs; [
      age
      envsubst
      fluxcd
      go-task
      jq
      k9s
      kubectl
      kubernetes-helm
      kustomize
      minio-client
      nodePackages.zx
      pulumi-bin
      sops
      talosctl
    ] ++ [
      # myPkgs.krr
      myPkgs.kubectl-rook-ceph
      myPkgs.talhelper
    ];
  };
}
