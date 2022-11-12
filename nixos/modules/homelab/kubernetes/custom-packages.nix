{ buildGoModule, fetchFromGitHub, installShellFiles, stdenv, lib }:

{
  talhelper = buildGoModule rec {
    pname = "talhelper";
    version = "1.5.3";

    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-rjY2WXNUrd8iAPCkbnKgu0zDb5lrPoq8dHVEqudrxgM=";
    };

    vendorSha256 = "sha256-TENT/fR3HPLRvPF00QemxygDNgCmjQ4RZ4xjgAI15zs=";

    ldflags = [ "-s -w -X github.com/budimanjojo/talhelper/cmd.version=v${version}" ];

    nativeBuildInputs = [ installShellFiles ];

    doInstallCheck = true;
    installCheckPhase = ''
      $out/bin/talhelper --version | grep ${version} > /dev/null
    '';

    postInstall = lib.optionalString (stdenv.hostPlatform == stdenv.buildPlatform) ''
      for shell in bash fish zsh; do
        $out/bin/talhelper completion $shell > talhelper.$shell
        installShellCompletion talhelper.$shell
      done
    '';

    meta = with lib; {
      description = "A tool to help creating Talos kubernetes cluster";
      longDescription = ''
        Talhelper is a helper tool to help creating Talos Linux cluster 
        in your GitOps repository.
      '';
      homepage = "https://github.com/budimanjojo/talhelper";
      license = licenses.bsd3;
    };
  };
}
