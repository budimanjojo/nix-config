{ pkgs }:
pkgs.writeTextFile {
  name = "configure-gtk";
  destination = "/bin/configure-gtk";
  executable = true;
  text = let
    schema = pkgs.gsettings-desktop-schemas;
    datadir = "${schema}/share/gsettings-schemas/${schema.name}";
  in "
    export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
    gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Dark-B'
    gsettings set org.gnome.desktop.interface icon-theme 'Tokyonight-Dark'
    gsettings set org.gnome.desktop.interface cursor-theme 'Vimix Cursors'
    gsettings set org.gnome.desktop.interface font-name 'UbuntuMono Nerd Font 12'
    gsettings set org.gnome.desktop.wm.preferences button-layout ':appmenu'
  ";
}
