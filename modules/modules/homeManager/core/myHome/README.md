# Overview

This directory contains my home-manager modules.
All `nixosHosts` and `homeHosts` will have access to these modules.

They live inside `config.mySystem` and follow the directory structure as module naming.
Module inside `./browser/firefox` is available in `config.myHome.browser.firefox`.

Most modules have `enable` switch that is `false` by default.
Some other modules will be automatically enabled by logic.
For example, to enable firefox browser on `labubu` host for `budiman`, add this to a file somewhere:

```nix
{
  flake.modules.homeManager."budiman@labubu" = {
    myHome.browser.firefox.enable = true;
  }
}
```
