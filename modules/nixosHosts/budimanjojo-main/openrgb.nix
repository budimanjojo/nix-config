{
  flake.modules.nixos.budimanjojo-main = { pkgs, ... }: {
    services.udev.packages = [ pkgs.openrgb ];
    boot = {
      kernelModules = [
        "i2c-dev"
        "i2c-piix4"
      ];
      kernelParams = [ "acpi_enforce_resources=lax" ]; # this is needed for my motherboard
    };

    systemd = {
      services."openrgb-manager" = {
        wantedBy = [ "multi-user.target" ]; # start at boot time too
        script = ''
          set -eu
          now=$(date +%H%M)
          cmd=(${pkgs.openrgb}/bin/openrgb --noautoconnect)

          if [[ "$now" > "0659" && "$now" < "2200" ]]; then
            echo "Time is $now"
            "''${cmd[@]}" \
              -d 0 -m "Rainbow" \
              -d 1 -m "Rainbow" \
              -d 2 -z 0 -m "Direct" -c 666666 \
              -d 2 -m "Digital D" -s 15
            echo "It's party time!"
          else
            echo "Time is $now"
            "''${cmd[@]}" \
              -d 0 -m "Off" \
              -d 1 -m "Off" \
              -d 2 -m "Direct" -c 000000
            echo "It's lights out time!"
          fi
        '';
        serviceConfig = {
          Type = "oneshot";
        };
        # create a timer that runs on calendar too
        startAt = [
          "*-*-* 07:00"
          "*-*-* 22:00"
        ];
      };
    };
  };
}
