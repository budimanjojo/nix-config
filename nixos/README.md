<div align="center">

<img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/376ed4ba8dc2e611b7e8a62fdc680967ead5bd87/logo/nix-snowflake.svg" align="center" width="100px" height="100px"/>

#### My NixOS configuration IaC

...Managed with Flakes :snowflake:&nbsp;

</div>


## :book:&nbsp; Overview

This directory holds my NixOS systems in a declarative way using `Flakes`.
This is still Work In Progress so stuffs will definitely change from time to time.
If you prefer using only `chezmoi` to manage your dotfiles instead, go back from [here](../README.md).
Screenshots, plugins list, and keybindings are identical whether you go with `flakes` or `chezmoi`.

## :package:&nbsp; Modules

- [sops-nix](https://github.com/Mic92/sops-nix) is used to encrypt/decrypt my secrets safely.
- [Flake Parts](https://github.com/hercules-ci/flake-parts) to manage `flakes`.
- [home-manager](https://github.com/nix-community/home-manager) to manage my home directory and dotfiles.
- [NUR](https://github.com/nix-community/NUR) for packages not available in the official NixOS repository.

## :open_file_folder:&nbsp; Directory structure

The structure of this repository is highly opinionated.
I shamelessly took the pieces I believe is the best from people and modified it.

- [../flake.nix](../flake.nix) is the entrypoint for `nix-rebuild` command.
- [../flake.lock](../flake.lock) is the lock file, updated daily by `budimanjojo-bot` powered by [Renovate](https://github.com/renovatebot/renovate).
- [./lib](./lib) is where I put my own helper functions.
- [./modules/device.nix](./modules/device.nix) is where you can look at the available options for each machine.
- [./modules/nixos/default.nix](./modules/nixos/default.nix) is where all my NixOS modules are defined.
- [./modules/home-manager/default.nix](./modules/home-manager/default.nix) is where all my home-manager modules are defined.
- [./packages](./packages) is where I put extra packages not available in the official repo and `NUR`.
- [./hosts/nixos-configuration.nix](./hosts/nixos-configuration.nix) contains default NixOS configuration for all machines.
- [./hosts/hm-configuration.nix](./hosts/hm-configuration.nix) contains default home-manager configuration for all machines.
- [./hosts/\<hostname\>/nixos-configuration.nix](./hosts/budimanjojo-main/nixos-configuration.nix) contains machine specific NixOS configuration.
- [./hosts/\<hostname\>/hm-configuration.nix](./hosts/budimanjojo-main/hm-configuration.nix) contains machine specific home-manager configuration.
- [./hosts/\<hostname\>/shared-configuration.nix](./hosts/budimanjojo-main/shared-configuration.nix) contains machine specific shared configuration for both NixOS and home-manager.
- [./hosts/\<hostname\>/hardware-configuration.nix](./hosts/budimanjojo-vm/hardware-configuration.nix) contains machine specific hardware configuration.

## :inbox_tray:&nbsp; How to use

### NixOS

- Fork this repository, or clone it, or do whatever you want.
- Copy a directory in `./hosts` to your machine name, i.e from the root of this repo do `cp ./nixos/hosts/budimanjojo-vm ./nixos/hosts/your-machine`
- Copy your `/etc/nixos/hardware-configuration.nix` into `./nixos/hosts/your-machine/hardware-configuration.nix`
- Edit `./nixos/hosts/your-machine/{hm|shared|nixos}-configuration.nix` to your liking.
- Edit `./flake.nix`, under `outputs.nixosConfigurations` put `your-machine = myLib.mkNixosSystem "<cpu-arch>" "<hostname>" "<username>;"` and optionally under `outputs.homeConfigurations` put `"your-username@yourmachine" = myLib.mkHome "<cpu-arch>" "<hostname>" "<username>";`.
- Do `sudo nixos-rebuild --flake .#your-machine` and optionally `nix run nixpkgs#home-manager -- switch --flake .` and you're done.

## :lock_with_ink_pen:&nbsp; Secret management

I'm using `sops-nix` to manage secrets.
Feel free to modify it to your liking.

## :robot:&nbsp; Package updates

I use [renovatebot](https://github.com/renovatebot/renovate) to update [flake.nix](../flake.nix) file.
I also use [nvfetcher](https://github.com/berberman/nvfetcher) to update my [custom packages](./packages/_sources/generated.nix).
There are GitHub workflows to do this automatically everyday.

## :coffee:&nbsp; Acknowledgements

I wrote most of the codes by myself, but there are a lot of stuffs inspired by these repositories.

* [MatthiasBenaets/nixos-config](https://github.com/MatthiasBenaets/nixos-config) for the awesome YouTube video introducing NixOS to me.
* [RicArch97/nixos-config](https://github.com/RicArch97/nixos-config) for showing the way to merge system and home-manager in a file.
* [notusknot/dotfiles-nix](https://github.com/notusknot/dotfiles-nix) for the clean function to define new `nixosConfigurations`.
* [viperML/dotfiles](https://github.com/viperML/dotfiles) for answering stupid questions on Discord.
