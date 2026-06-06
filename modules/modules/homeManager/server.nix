{
  flake.modules.homeManager.server = {
    config.myHome = {
      shell.fish.enable = true;
      multiplexer.tmux.enable = true;
    };
  };
}
