{
  lib,
  config,
  osConfig,
  pkgs,
  myPkgs,
  ...
}:
let
  inherit (lib) myLib mkEnableOption mkIf;

  cfg = config.myHome.shell.fish;
  isNixos = myLib.isNixos osConfig;
in
{
  options.myHome.shell.fish = {
    enable = mkEnableOption "fish shell";
  };

  config = mkIf (cfg.enable) {
    myHome.shell = {
      dircolors.enable = true;
      starship.enable = true;
    };

    programs = {
      fish = {
        enable = true;
        package = mkIf (!isNixos) (
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
              # TODO: might be better off use native fzf support
              name = "fzf-fish";
              src = fzf-fish.src;
            }
            {
              name = "puffer";
              src = puffer.src;
            }
            {
              name = "abbreviation-tips";
              src = myPkgs.fish-plugins.abbreviation-tips.src;
            }
          ]
          ++ [
            (mkIf (config.programs.tmux.enable && !config.programs.zellij.enable) {
              name = "tmux-fish";
              src = myPkgs.fish-plugins.tmux-fish.src;
            })
          ];

        functions = {
          mkcd = {
            body = "mkdir -p $argv; cd $argv";
            description = "mkdir and cd into in";
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

          # override default colors
          set -l orange FF9E64
          set -l pink BB9AF7
          set -l purple 9D7CD8
          set -l grey1 565F89
          set -l grey2 33467C
          set fish_color_normal white
          set fish_color_command cyan
          set fish_color_keyword $pink
          set fish_color_quote yellow
          set fish_color_redirection white
          set fish_color_end $orange
          set fish_color_error red --bold
          set fish_color_param $purple
          set fish_color_comment $grey1
          set fish_color_selection --background $selection
          set fish_color_match yellow
          set fish_color_search_match --background $grey2
          set fish_color_operator green  You, 2023-12-12 -
          set fish_color_escape $pink
          set fish_color_autosuggestion $comment
          set fish_pager_color_progress $comment
          set fish_pager_color_prefix cyan
          set fish_pager_color_completion white
          set fish_pager_color_description $comment
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

      bat = {
        enable = true;
        config.theme = "ansi";
      };

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
        catppuccin.enable = true;
      };
    };
    home.packages = with pkgs; [
      eza
      fd
    ];
  };
}
