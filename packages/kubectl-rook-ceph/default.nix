{
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
  lib,
}:

buildGoModule rec {
  pname = "kubectl-rook-ceph";
  version = "v0.5.2";

  src = fetchFromGitHub {
    owner = "rook";
    repo = pname;
    rev = version;
    sha256 = "sha256-fRkC1rr+jFZ6xp1aU1vxqLqW1OTeZgyJPwC+FIeKFcc=";
  };

  vendorHash = "sha256-D1k4+1PsBMtGwYVDacrLOSKUhWLOIY/KIooIt7Qo/QE=";

  nativeBuildInputs = [ installShellFiles ];

  subPackages = [ "cmd" ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/kubectl-rook_ceph

    # Shell completion for `kubectl rook-ceph`
    # Quite ugly but it works, see: https://github.com/kubernetes/kubernetes/pull/105867
    cat <<EOF >$out/bin/kubectl_complete-rook_ceph
    #!/usr/bin/env sh

    kubectl rook-ceph __complete "\$@"
    EOF

    chmod u+x $out/bin/kubectl_complete-rook_ceph

    # This is the more elegant way of doing it but it doesn't work
    # for shell in bash fish zsh; do
    #   $out/bin/kubectl-rook_ceph completion $shell > kubectl-rook_ceph.$shell
    #   installShellCompletion  kubectl-rook_ceph.$shell
    # done
  '';

  meta = with lib; {
    description = "kubectl plugin to run kubectl commands with rook-ceph";
    homepage = "https://github.com/rook/kubectl-rook-ceph";
    licence = licences.asl20;
  };
}
