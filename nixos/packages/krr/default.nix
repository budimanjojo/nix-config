{ lib,  python3, fetchFromGitHub, pkgs }:
let
  prometheus-api-client = pkgs.callPackage ./prometheus-api-client.nix { };
in

python3.pkgs.buildPythonPackage rec {
  pname = "krr";
  version = "1.0.0-rc0";
  src = fetchFromGitHub {
    owner = "robusta-dev";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-orfwzwaNPBWD4NYW4PGCcIepGAj1QKXDJzOFKQ46mcg=";
  };

  format = "pyproject";

  propagatedBuildInputs = with pkgs.python3Packages; [ 
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
