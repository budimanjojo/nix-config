{ stdenvNoCC, fetchFromGitHub, lib }:

stdenvNoCC.mkDerivation {
  pname = "tokyonight-gtk-theme";
  version = "2022-10-21";

  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Tokyo-Night-GTK-Theme";
    rev = "6247aafad59a9231d8638de2a09174779761ffeb";
    sha256 = "sha256-vxSu5FW4XSvOyHK/Zl4Wh2Tik6cKBSE22C3AE9cRkoE=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes
    cp -r ./themes/* $out/share/themes/

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
