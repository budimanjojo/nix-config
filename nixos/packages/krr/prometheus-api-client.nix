{ lib
, python3
, fetchFromGitHub
, pkgs
, ...
}:
python3.pkgs.buildPythonPackage rec {
  pname = "prometheus-api-client";
  version = "0.5.3";
  src = fetchFromGitHub {
    owner = "4n4nd";
    repo = "prometheus-api-client-python";
    rev = "v${version}";
    sha256 = "sha256-MouJPpiY3y/RgXc9orlT8GT8l+fIxozjUT7sphyedIM=";
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
}
