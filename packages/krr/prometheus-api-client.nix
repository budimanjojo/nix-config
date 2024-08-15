{
  lib,
  python3,
  pkgs,
  callPackage,
  ...
}:

let
  sourceData = callPackage ../_sources/generated.nix { };
in

python3.pkgs.buildPythonPackage {
  inherit (sourceData.prometheus-api-client) pname version src;

  doCheck = false;

  propagatedBuildInputs = with pkgs.python3Packages; [
    matplotlib
    numpy
    pandas
    requests
    dateparser
    httmock
  ];

  meta = with lib; {
    description = "A python wrapper for the prometheus http api";
    homepage = "https://github.com/4n4nd/prometheus-api-client-python";
    licence = licences.mit;
  };
}
