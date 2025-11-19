set unstable := true
set shell := ['bash', '-euo', 'pipefail', '-c']

# `nix` is required
requireNixToRun := require('nix')

# the user running this needs to be a nix trusted-user for the extra-substituters to work
export NIX_CONFIG := '''
    extra-experimental-features = nix-command flakes
    extra-substituters = https://viperml.cachix.org https://budimanjojo.cachix.org
    extra-trusted-public-keys = viperml.cachix.org-1:qZhKBMTfmcLL+OG6fj/hzsMEedgKvZVFRRAhq7j8Vh8= budimanjojo.cachix.org-1:S0gy6IKTFXis9fFqEbVAS2zsvnZw/30NV2bWvGiN1YQ=
'''

# we use nix shebang to get into a nix shell with packages that's needed for each recipe
nixShebang := '/usr/bin/env -S nix shell --inputs-from ' + justfile_directory()
realShebang := '/usr/bin/env bash -euo pipefail'

[private]
default:
    @just -l

# update packages managed by `nvfetcher`
[group('repository')]
update-packages:
    #! {{ nixShebang }} nixpkgs#nvfetcher -c {{ realShebang }}
    cd ./packages
    nvfetcher

# update SOPS keys
[group('repository')]
update-sops-keys:
    #! {{ nixShebang }} nixpkgs#sops nixpkgs#findutils -c {{ realShebang }}
    find . -type f -name \*.sops.yaml ! -name .sops.yaml -exec sops updatekeys --yes {} \;

# do `nixos-rebuild switch` for current system
[group('nix')]
nixos-switch:
    sudo nixos-rebuild switch --flake .#{{ shell('hostname') }}

# do `home-manager switch` for current system
[group('nix')]
home-switch:
    home-manager switch --flake .#{{ shell('whoami') }}@{{ shell('hostname') }}

# create NixOS ISO
[group('nix')]
make-iso:
    nix build .#nixosConfigurations.nixos-livecd.config.system.build.isoImage

# garbage collect all unused store entries
[group('nix')]
gc day='7':
    # garbage collect all unused nix store entries (system-wide)
    sudo nix-collect-garbage --delete-older-than {{ day }}d
    # garbage collect all unused nix store entries (user-wide)
    # ref: https://github.com/NixOS/nix/issues/8508
    nix-collect-garbage --delete-older-than {{ day }}d

# verify all the store entries
# nix store can contains corrupted entries if the nix store object has been modified unexpectedly
# we need to fix the corrupted entries manually via `sudo nix store delete <path-1> <path-2> ...`
[group('nix')]
verify-store:
    nix store verify --all

# repair nix store objects
[group('nix')]
repair-store *paths:
    nix store repair {{ paths }}

# show all the auto gc root in the nix store
[group('nix')]
gcroot:
    #! {{ nixShebang }} nixpkgs#eza -c {{ realShebang }}
    eza -lag /nix/var/nix/gcroots/auto/
