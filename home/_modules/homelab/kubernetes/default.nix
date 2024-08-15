{
  config,
  lib,
  pkgs,
  myPkgs,
  ...
}:
let
  cfg = config.myHome.homelab.kubernetes;
in
{
  options.myHome.homelab.kubernetes = {
    enable = lib.mkEnableOption "Kubernetes tools for homelab";
  };

  config = lib.mkIf (cfg.enable) {
    myHome = {
      programs.yamllint.enable = true;
      shell = {
        git.enable = true;
        nix-direnv.enable = true;
      };
    };

    sops.secrets = {
      kubeconfig = {
        sopsFile = ./secret.sops.yaml;
        path = "${config.home.homeDirectory}/.kube/config";
      };
      talosconfig = {
        sopsFile = ./secret.sops.yaml;
        path = "${config.home.homeDirectory}/.talos/config";
      };
    };

    home.packages = with pkgs; [
      age
      envsubst
      fluxcd
      go-task
      jq
      kubectl
      kubernetes-helm
      kustomize
      nodePackages.zx
      talosctl
      myPkgs.kubectl-rook-ceph
      myPkgs.talhelper
    ];

    programs.fish.shellAbbrs = {
      # kubectl
      k = {
        position = "anywhere";
        expansion = "kubectl";
      };
      kgp = {
        position = "anywhere";
        expansion = "kubectl get pod";
      };
      kgn = {
        position = "anywhere";
        expansion = "kubectl get nodes";
      };
      kl = "kubectl logs";
      kdp = "kubectl describe pod";

      # flux
      f = {
        position = "anywhere";
        expansion = "flux";
      };
      fgk = {
        position = "anywhere";
        expansion = "flux get ks";
      };
      fsa = "flux suspend kustomizatin --all";
      fra = "flux resume kustomization --all";

      # talosctl
      t = "talosctl";

      # talhelper
      th = "talhelper";
    };
  };
}
