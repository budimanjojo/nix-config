{ stdenvNoCC, lib, callPackage, pkgs, }:

let
  sourceData = callPackage ../_sources/generated.nix {};
in
stdenvNoCC.mkDerivation {
  inherit (sourceData.tokyonight-gtk-theme) pname version src;

  nativeBuildInputs = [
    pkgs.gnome.gnome-shell
    pkgs.sassc
  ];

  builtInputs = [
    pkgs.gnome.gnome-themes-extra
  ];

  installPhase = ''
    runHook preInstall

    find -name "*.sh" -print0 | while IFS= read -r -d ''' file; do
      patchShebangs "$file"
    done

    mkdir -p $out/share/themes
    cd theme
    ./install.sh --dest $out/share/themes --name Tokyonight

    runHook postInstall
  '';

  meta = with lib; {
    description = "A GTK theme based on the Tokyo Night colour palette";
    longDescription = ''
      A GTK theme based on the colours of Folke's great theme: Tokyonight for Neovim, the VinceLiuice's awesome: Magnetic GTK theme and the creativity of Gusbemacbe's: Suru Plus Icon Theme.
Great to combine in your Gnome Desktop Environment and TWMs like: XmonadWM, AwesomeWM, BSPWM, etc... With support also for the desktop environments Cinnamon and XFCE.
    '';
    homepage = "https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme";
    license = licenses.gpl3Only;
  };
}
