{ ... }:
{
  config = {
    mySystem = {
      programs = {
        adb.enable = true;
        hugo.enable = true;
        qmk.enable = true;
      };
    };
    boot.plymouth.enable = true;
  };
}
