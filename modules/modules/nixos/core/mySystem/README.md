# Overview

This directory contains my NixOS modules.
All `nixosHosts` will have access to these modules.

They live inside `config.mySystem` and follow the directory structure as module naming.
Module inside `./system/autoupgrade` is available in `config.mySystem.system.autoupgrade`.

All modules have `enable` switch that is `false` by default.
For example, to enable auto upgrade on `labubu` host, add this to a file somewhere:

```nix
{
  flake.modules.nixos.labubu = {
    mySystem.system.autoupgrade.enable = true;
  }
}
```
