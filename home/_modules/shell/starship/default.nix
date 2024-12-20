{ config, lib, ... }:
let
  cfg = config.myHome.shell.starship;
in
{
  options.myHome.shell.starship = {
    enable = lib.mkEnableOption "Starship cross-shell prompt";
  };

  config = lib.mkIf (cfg.enable) {
    catppuccin.starship.enable = true;

    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        command_timeout = 1000;
        format = lib.concatStrings [
          "$os"
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_status"
          "$fill"
          "$direnv"
          "$nix_shell"
          "$python"
          "$cmd_duration"
          "$status"
          "$line_break"
          "$character"
        ];

        os = {
          disabled = false;
          format = "[](fg:blue)[ $symbol ](fg:mantle bg:blue)[](fg:blue bg:surface0)";
          symbols = {
            Arch = "󰣇 ";
            NixOS = "󱄅 ";
            Ubuntu = " ";
          };
        };

        username = {
          style_user = "fg:peach bg:surface0";
          style_root = "fg:red bg:surface0";
          format = "[ $user]($style)";
          show_always = false;
        };

        hostname = {
          ssh_only = true;
          format = "[@$hostname](fg:green bg:surface0)";
        };

        directory = {
          truncation_length = 3;
          format = "[ in](fg:text bg:surface0)[ $path ](fg:blue bg:surface0)([$read_only ](fg:red bg:surface0))[](fg:surface0)";
          read_only = "";
          truncation_symbol = "../";
          truncate_to_repo = true;
          fish_style_pwd_dir_length = 1;
        };

        git_branch = {
          format = "[ $symbol$branch ](fg:mauve)";
          symbol = " ";
        };

        git_status = {
          format = "[$all_status$ahead_behind](fg:mauve)";
          conflicted = " ";
          ahead = " ";
          behind = " ";
          diverged = "󰆗 ";
          up_to_date = " ";
          untracked = " ";
          stashed = " ";
          modified = " ";
          staged = " ";
          renamed = " ";
          deleted = " ";
        };

        fill = {
          symbol = " ";
        };

        direnv = {
          disabled = false;
          format = "[$symbol\\($loaded/$allowed\\) ](fg:blue)";
          symbol = "  ";
        };

        nix_shell = {
          format = "[$symbol(\\($name\\)) ](fg:blue)";
          heuristic = true; # needed to detect `nix shell`
          symbol = "󱄅 "; # the default unicode is causing issue https://github.com/starship/starship/issues/5924
        };

        python = {
          format = "[\${symbol}\${pyenv_prefix}(\${version} )(\($virtualenv\) )]($style)";
          symbol = "🐍 ";
        };

        cmd_duration = {
          min_time = 0;
          format = "[](fg:surface0)[ took](fg:text bg:surface0)[ $duration ](fg:yellow bg:surface0)";
        };

        status = {
          disabled = false;
          format = "[](fg:blue bg:surface0)[ $symbol](fg:mantle bg:blue)[](fg:blue)";
          symbol = " ";
          success_symbol = " ";
        };

        character = {
          success_symbol = "[](green)";
          error_symbol = "[](green)";
          vicmd_symbol = "[](mauve)";
        };
      };
    };
  };
}
