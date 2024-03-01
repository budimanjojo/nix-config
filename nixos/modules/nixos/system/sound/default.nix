{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.modules.system.sound;
  deviceCfg = config.deviceCfg;
in {
  options.modules.system.sound = { enable = mkEnableOption "sound"; };

  config = mkIf (cfg.enable && deviceCfg.hasSound) {
    # security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.configPackages = [
        (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
          bluez_monitor.properties = {
            ["bluez5.enable-sbc-xq"] = true,
            ["bluez5.enable-msbc"] = true,
            ["bluez5.enable-hw-volume"] = true,
            ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
          }
        '')
      ];
    };
  };
}

