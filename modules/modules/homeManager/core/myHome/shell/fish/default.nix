{ myLib, self, ... }:
{
  flake.modules.homeManager.core =
    {
      config,
      osConfig ? { },
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.myHome.shell.fish;
      isNixos = myLib.isNixos osConfig;
      sourceData = pkgs.callPackage "${self}/packages/_sources/generated.nix" { };
    in
    {
      options.myHome.shell.fish.enable = lib.mkEnableOption "fish shell";

      config = lib.mkIf (cfg.enable) {
        myHome.shell = {
          dircolors.enable = true;
          starship.enable = true;
        };

        catppuccin = {
          fish.enable = true;
          # TODO: wait for the IFD issue is fixed
          # ref: https://github.com/catppuccin/nix/issues/392
          fzf.enable = lib.mkIf (pkgs.stdenv.hostPlatform.system == "x86_64-linux") true;
          bat.enable = true;
        };

        programs = {
          fish = {
            enable = true;
            package = lib.mkIf (!isNixos) (
              pkgs.fish.override {
                fishEnvPreInit = ''
                  # This will ensure that $NIX_PROFILE variable is set as fast as possible
                  # so Nix managed programs can work properly without needing to tweak the OS.
                  # Usually this is done by Nix installer by putting these lines inside fish system config dir
                  # but it's a hit or miss especially when fish is not installed in the system beforehand.
                  # And I also found problem that vendor completion of Nix installed programs are not working
                  # without calling fish twice, I assume it's because $NIX_PROFILE is not set fast enough
                  if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
                    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
                  end
                '';
              }
            );
            plugins =
              with pkgs.fishPlugins;
              [
                {
                  name = "autopair";
                  src = autopair.src;
                }
                {
                  # TODO: might be better off uses native fzf support
                  name = "fzf-fish";
                  src = fzf-fish.src;
                }
                {
                  name = "puffer";
                  src = puffer.src;
                }
                {
                  name = "abbreviation-tips";
                  inherit (sourceData.abbreviation-tips) src;
                }
                {
                  name = "fish-completion-sync";
                  inherit (sourceData.fish-completion-sync) src;
                }
              ]
              ++ [
                (lib.mkIf (config.programs.tmux.enable && !config.programs.zellij.enable) {
                  name = "tmux-fish";
                  inherit (sourceData.tmux-fish) src;
                })
              ];

            functions = {
              mkcd = {
                body = "mkdir -p $argv; cd $argv";
                description = "mkdir and cd into it";
              };
            };

            shellInit = ''
              # disable fish greeting
              set -g fish_greeting

              # Termite and Alacritty tmux ssh error workaround
              if test $TERM = xterm-termite; or test $TERM = alacritty
                set -gx TERM xterm-256color
              end
            '';

            interactiveShellInit = ''
              # use vi keybindings
              fish_vi_key_bindings

              # fzf-fish
              set fzf_preview_dir_cmd eza --all --color=always
              set fzf_fd_opts --hidden --exclude=.git --exclude=.github --exclude=.cache
              fzf_configure_bindings --git_log=\cg --git_status=\cs --variables=\cv --directory=\cf --history=\cr

              ${lib.optionalString config.programs.tmux.enable "set fish_tmux_autostart true"}
            '';

            shellAbbrs = {
              cpr = "cp -rf";
              rmr = "rm -rf";
              md = "mdir -p";
              rd = "rmdir";

              # eza
              lsa = "eza -lag --git --icons --sort=type";
              ll = "eza -l --git --icons --sort = type";
            };
          };

          zoxide.enable = true;
          bat.enable = true;

          fzf = {
            enable = true;
            defaultCommand = "${pkgs.fd}/bin/fd --type f";
            defaultOptions = [
              "--cycle"
              "--layout reverse"
              "--border"
              "--height 40%"
              "--preview-window wrap"
              "--marker *"
            ];
            changeDirWidgetCommand = "${pkgs.fd}/bin/fd --type d";
            changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
          };
        };

        home.packages = with pkgs; [
          eza
          fd
        ];
      };
    };
}
