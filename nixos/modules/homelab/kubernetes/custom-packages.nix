{ buildGoModule, fetchFromGitHub, installShellFiles, stdenv, lib }:

{
  talhelper = buildGoModule rec {
    pname = "talhelper";
    version = "1.5.4";

    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-p0xoK700C9cmjpw2eLMfU4ctH1YQaQiZn2OJIPxkPeg=";
    };

    vendorSha256 = "sha256-cmESl8/V81RPB2MdRBpSG2mIStB8Wj/GQmI8IPSlOIU=";

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
