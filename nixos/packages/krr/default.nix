{
  lib,
  python3,
  callPackage,
  pkgs,
}:
let
  sourceData = callPackage ../_sources/generated.nix { };
  prometheus-api-client = callPackage ./prometheus-api-client.nix { };
  alive-progress = callPackage ./alive-progress.nix { };
in

python3.pkgs.buildPythonPackage {
  inherit (sourceData.krr) pname version src;

  format = "pyproject";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace "pydantic = \"1.10.7\"" "pydantic = \">=1.10.7\"" \
      --replace "typer = {extras = [\"all\"], version = \"^0.7.0\"}" "typer = {extras = [\"all\"], version = \">=0.7.0\"}"
  '';

  propagatedBuildInputs = with pkgs.python3Packages; [
    alive-progress
    cachetools
    certifi
    charset-normalizer
    click
    colorama
    commonmark
    contourpy
    cycler
    dateparser
    fonttools
    google-auth
    httmock
    idna
    kiwisolver
    kubernetes
    matplotlib
    numpy
    oauthlib
    packaging
    pandas
    pillow
    prometheus-api-client
    poetry-core
    pyasn1-modules
    pyasn1
    pydantic
    pygments
    pyparsing
    python-dateutil
    pytz-deprecation-shim
    pytz
    pyyaml
    regex
    requests-oauthlib
    requests
    rich
    rsa
    setuptools
    shellingham
    six
    typer
    typing-extensions
    tzdata
    tzlocal
    urllib3
    websocket-client
  ];

  meta = with lib; {
    description = "Prometheus-based Kubernetes Resource Recommendations";
    homepage = "https://github.com/robusta-dev/krr";
    licence = licences.mit;
  };
}
