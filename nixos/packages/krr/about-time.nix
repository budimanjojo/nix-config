{
  lib,
  python3,
  callPackage,
  ...
}:

let
  sourceData = callPackage ../_sources/generated.nix { };
in

python3.pkgs.buildPythonPackage {
  inherit (sourceData.about-time) pname version src;

  doCheck = false;

  meta = with lib; {
    description = "Easily measure timing and throughput of code blocks, with beautiful human friendly representations";
    homepage = "https://github.com/rsalmei/about-time";
    licence = licences.mit;
  };
}
