{ stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname = "rofi-firefox-wrapper";
  version = "1.0.0";

  src = ./files;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp rofi-firefox-wrapper.sh $out/bin/rofi-firefox-wrapper
    chmod +x $out/bin/rofi-firefox-wrapper
    runHook postInstall
  '';

  meta = {
    description = "Script to show Firefox profile selector using Rofi";
  };
}
