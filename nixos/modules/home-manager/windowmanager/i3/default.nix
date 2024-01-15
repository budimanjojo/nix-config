{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.windowmanager.i3;
  deviceCfg = config.deviceCfg;
in {
  options.hm-modules.windowmanager.i3 = { enable = mkEnableOption "i3"; };

  config = mkIf cfg.enable {
    hm-modules.windowmanager.add-on.blueman-applet.enable = true;
    hm-modules.windowmanager.add-on.dunst.enable = true;
    hm-modules.windowmanager.add-on.gtk-theme.enable = true;
    hm-modules.windowmanager.add-on.nm-applet.enable = true;
    hm-modules.windowmanager.add-on.rofi.enable = true;
    hm-modules.windowmanager.add-on.pasystray.enable = true;
    hm-modules.windowmanager.add-on.picom.enable = true;
    hm-modules.windowmanager.add-on.py3status.enable = true;
    hm-modules.windowmanager.add-on.xdg.enable = true;

    hm-modules.terminal-emulator.alacritty.enable = true;

    assertions = [
      {
        assertion = length deviceCfg.monitors > 0;
        message = ''
          At least one monitor in the `config.deviceCfg.monitors` is
          needed to use i3 module.
        '';
      }
    ];

    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraConfig = let
        mon1 = elemAt deviceCfg.monitors 0;
        mon2 = if length deviceCfg.monitors >= 2 then elemAt deviceCfg.monitors 1 else elemAt deviceCfg.monitors 0;
      in ''
        # VARIABLES ARE SET HERE
        # default Modifier to Super key. Alternatively, still enable Alt for floating window dragging and resizing
        set $super Mod4
        set $alt Mod1
        # default applications
        set $browser rofi-firefox-wrapper
        set $filemanager thunar
        set $terminal alacritty
        # mode string to show on bar
        set $mode_resize Resize (h/Left) shrink width, (j/Down) shrink height, (k/Up) groiw height, (l/Right) grow width
        set $mode_gaps Gaps (o) outer, (i) inner
        set $mode_gaps_outer Outer Gaps (k/Up) grow locally, (K/Shift+Up) grow globally
        set $mode_gaps_inner Inner Gaps (k/Up) grow locally, (K/Shift+Up) grow globally
        set $mode_system System (l) lock, (e) logout, (r) reboot, (s) shutdown (f) UEFI
        set $mode_screenshot Screenshot (Enter), Full Screenshot, (S) Select Region
        # locker command
        set $Locker i3lock && sleep 1
        # scrot command
        set $scrot_capture scrot 'screenshot-%Y-%m-%d_%H-%M-%S.png' -e 'mv $f ~/Desktop/'
        set $scrot_region scrot -s 'screenshot-%Y-%m-%d_%H-%M-%S.png' -e 'mv $f ~/Desktop/'
        # workspace naming
        set $ws1 1: Youtube
        set $ws2 2: Home
        set $ws3 3: Media
        set $ws4 4: Steam
        set $ws5 5: File
        set $ws6 6: Web
        set $ws7 7: Gimp
        set $ws8 8: Vim
        set $ws9 9: Record
        set $ws10 10: VBox
        # monitor naming
        set $monleft ${mon1}
        set $monright ${mon2}
        # Tokyonight Night colors
        set $border-color #1A1B26
        set $bg-color #1A1B26
        set $inac-bg-color #1A1B26
        set $text-color #F7768E
        set $inac-text-color #C0CAF5
        set $urgent-bg-color #F7768E
        set $indi-color #A9B1D6
        set $urgent-text-color #C0CAF5
      '';
      config = {
        floating.modifier = "Mod1";
        focus = {
          wrapping = "yes";
          followMouse = true;
          newWindow = "urgent";
        };
        gaps = {
          inner = 10;
          outer = 5;
          smartGaps = true;
        };
        keybindings = import ./configs/keybindings.nix;
        modes = import ./configs/modes.nix;
        workspaceOutputAssign = import ./configs/ws-outputs.nix;
        assigns = import ./configs/assigns.nix;
        window.commands = import ./configs/commands.nix;
        colors = import ./configs/colors.nix;
        bars = import ./configs/bars.nix;
        startup = import ./configs/startups.nix { inherit pkgs; };
      };
    };
    xdg.configFile."i3/sounds".source = ./sounds;
    xdg.configFile."i3/wallpapers".source = ./wallpapers;
  };
}
