{ lib, deviceCfg, pkgs, ... }:
with lib;
let
  mon1 = getAttr "name" (elemAt deviceCfg.monitors 0);
  mon2 = if length deviceCfg.monitors >= 2 then getAttr "name" (elemAt deviceCfg.monitors 1) else getAttr "name" (elemAt deviceCfg.monitors 0);
  mon2width = if mon2 != mon1 then getAttr "width" (elemAt deviceCfg.monitors 1) else getAttr "width" (elemAt deviceCfg.monitors 0);
  nvidiaSpecific = if deviceCfg.gpu != "nvidia" then "" else ''
    env = LIBVA_DRIVER_NAME,nvidia
    env = XDG_SESSION_TYPE,wayland
    env = GBM_BACKEND,nvidia-drm
    env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    env = WLR_NO_HARDWARE_CURSORS,1
  '';
in
 ''
  # VARIABLES ARE SET HERE
  # Modifier default to Super key. Alt key for window navigating
  $super = SUPER
  $alt = ALT
  # Default applications
  $terminal = alacritty
  $browser = rofi-firefox-wrapper
  $filemanager = thunar
  # Mode string to show on bar
  $resize = Resize: (h/Left) width-, (j/Down) height-, (k/Up) height+, (l/Right) width+
  $system = System: (l) lock, (e) logout, (r) reboot, (s) shutdown (f) uefi
  $screenshot = Screenshot: (Enter) Full Screenshot, (S) Select Region
  # locker command
  $locker = swaylock && sleep 1
  # grim command
  $grim_capture = GRIM_DEFAULT_DIR=~/Desktop grim
  $grim_region = GRIM_DEFAULT_DIR=~/Desktop grim -g "$(slurp)"
  # Monitors
  $monleft = ${mon1}
  $monright = ${mon2}
  # Tokyonight Night colors
  $border-color = rgb(A9B1D6)
  $bg-color = rgb(1A1B26)
  $inac-bg-color = rgb(1A1B26)
  $text-color = rgb(F7768E)
  $inac-text-color = rgb(A9B1D6)
  $urgent-bg-color = rgb(F7768E)
  $indi-color = rgb(7AA2F7)
  $urgent-text-color = rgb(A9B1D6)

  # Monitor placement
  monitor = $monleft, preferred, 0x0, 1
  monitor = $monright, preferred, ${mon2width}x0, 1

  # Wallpaper
  exec-once = ${pkgs.swaybg}/bin/swaybg -o $monleft -i ~/.config/hypr/wallpapers/tokyonight01-left.png
  exec-once = ${pkgs.swaybg}/bin/swaybg -o $monright -i ~/.config/hypr/wallpapers/tokyonight01-right.png

  # General settings
  general {
    resize_on_border = true
  }
  input {
    numlock_by_default = true
    follow_mouse = 1
  }
  misc {
    mouse_move_enables_dpms = true
    key_press_enables_dpms = true
  }
  ${nvidiaSpecific}

  source = ./configs/keybindings.conf
  source = ./configs/modes.conf
  source = ./configs/ws-outputs.conf
  source = ./configs/window-rules.conf
  source = ./configs/appearances.conf
''
