{
  lib,
  python3,
  pkgs,
  callPackage,
  ...
}:

let
  sourceData = callPackage ../_sources/generated.nix { };
  about-time = callPackage ./about-time.nix { };
in

python3.pkgs.buildPythonPackage {
  inherit (sourceData.alive-progress) pname version src;

  doCheck = false;

  propagatedBuildInputs = with pkgs.python3Packages; [
    about-time
    grapheme
  ];

  meta = with lib; {
    description = "A new kind of Progress Bar, with real-time throughput, ETA, and very cool animations!";
    homepage = "https://github.com/rsalmei/alive-progress";
    licence = licences.mit;
  };
}
