{ lib, config, ... }:
{
  plugins.snacks.settings = {
    styles.input = {
      relative = "cursor";
      row = -3;
      col = 0;
      b.completion = lib.mkIf config.plugins.blink-cmp.enable true;
    };
    input = {
      enabled = true;
    };
  };
}
