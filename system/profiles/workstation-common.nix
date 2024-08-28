{ ... }:
{
  config = {
    mySystem = {
      programs = {
        adb.enable = true;
        hugo.enable = true;
        qmk.enable = true;
      };
      monitoring.smartctl-exporter.enable = true;
    };
    boot.plymouth.enable = true;
  };
}
