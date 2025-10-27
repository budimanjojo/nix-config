{
  plugins.mini.modules.trailspace = { };

  autoGroups.trailspace.clear = true;
  autoCmd = [
    {
      event = [ "BufWritePre" ];
      pattern = [ "*" ];
      group = "trailspace";
      callback = {
        __raw = ''
          function()
            MiniTrailspace.trim()
            MiniTrailspace.trim_last_lines()
          end
        '';
      };
    }
  ];
}
