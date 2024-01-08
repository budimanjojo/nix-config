{ stdenvNoCC, hicolor-icon-theme, gtk3, lib, callPackage }:

let
  sourceData = callPackage ../_sources/generated.nix {};
in

stdenvNoCC.mkDerivation {
  inherit (sourceData.tokyonight-icon-theme) pname version src;

  nativeBuildInputs = [ gtk3 ];

  propagatedBuildInputs = [ hicolor-icon-theme ];

  dontDropIconThemeCache = true;

  # These fixup steps are slow and unnecessary for this package
  dontPatchELF = true;
  dontRewriteSymlinks = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons
    cp -r ./icons/Tokyonight-* $out/share/icons/

    for theme in $out/share/icons/*; do
      gtk-update-icon-cache $theme
    done

    runHook postInstall
  '';

  meta = with lib; {
    description = "A GTK theme based on the Tokyo Night colour palette";
    longDescription = ''
      Tokyonight is a GTK theme based on the colour palette of the Tokyonight for Neovim by @Folke, the Graphite GTK theme by @VinceLiuice and the Suru Plus icons by @gusbemacbe.
      The idea was born from the need for GTK themes that match the most prominent colour palettes of Neovim code editor and Tiling Window Manager, such as Xmonad, Awesome, DWM, etc, which use these colour schemes to give a uniform and unique look to working environments. See on Reddit: r/unixporn.
      The colour palettes in this series of themes are the ones I have used the most in my setup for Neovim, Xmonad and Gnome DE, so creating themes started as something personal that I then decided to share thanks to several people asking me to share them because they seemed good, I hope you find them useful and make your desktops look good too.
    '';
    homepage = "https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme";
    license = licenses.gpl3Only;
  };
}
