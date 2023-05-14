{ lib, python3, fetchPypi, pkgs, ... }:

python3.pkgs.buildPythonPackage rec {
  pname = "prometheus-api-client";
  version = "0.5.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-mywpPCAgcuXPZxmanMQdXrMvAt2MwjxYR7YDzZzpm88=";
  };

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
