{
  lib,  python3, fetchFromGitHub, pkgs, ...}:
  let
    prometheus-api-client = pkgs.callPackage ./prometheus-api-client.nix { };
  in
  
  python3.pkgs.buildPythonPackage rec {
  
  pname = "krr";
  version = "0.1.0-alpha";
  src = fetchFromGitHub {
    owner = "robusta-dev";
    repo = "krr";
    rev = "cb6e88f7a5b42c85dd8ca0638e75c9d2aa8856b9";
    sha256 = "sha256-/9WoVJHStJeu7CPn4BzuaM6p4NGXFYQiBPVCd2fndRU=";
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
}