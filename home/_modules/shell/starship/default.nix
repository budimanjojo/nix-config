{ config, lib, ... }:
let
  cfg = config.myHome.shell.starship;
in
{
  options.myHome.shell.starship = {
    enable = lib.mkEnableOption "Starship cross-shell prompt";
  };

  config = lib.mkIf (cfg.enable) {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        command_timeout = 1000;
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_status"
          "$\{custom.direnv\}"
          "$fill"
          "$nix_shell"
          "$python"
          "$status"
          "$cmd_duration"
          "$line_break"
          "$character"
        ];

        username = {
          style_user = "yellow";
          style_root = "red";
          format = "[$user]($style)";
          show_always = false;
        };

        hostname = {
          ssh_only = true;
          format = "[@$hostname]($style) in ";
          style = "green";
        };

        directory = {
          truncation_length = 3;
          format = "[$path]($style)[$read_only]($read_only_style) ";
          style = "blue";
          read_only = " ";
          truncation_symbol = "../";
          truncate_to_repo = true;
          fish_style_pwd_dir_length = 1;
        };

        git_branch = {
          format = "on [$symbol$branch]($style) ";
          style = "purple";
          symbol = " ";
        };

        git_status = {
          format = "([$all_status$ahead_behind]($style) )";
          style = "purple";
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

        nix_shell = {
          format = "[$symbol\\($name\\) ]($style)";
          heuristic = true; # needed to detect `nix shell`
          symbol = "󱄅 "; # the default unicode is causing issue https://github.com/starship/starship/issues/5924
        };

        python = {
          format = "[\${symbol}\${pyenv_prefix}(\${version} )(\($virtualenv\) )]($style)";
          symbol = "🐍 ";
        };

        status = {
          disabled = false;
          format = "[$symbol]($style) ";
          symbol = " ";
          success_symbol = " ";
          style = "red";
        };

        cmd_duration = {
          min_time = 2000;
          format = "took [$duration]($style) ";
          style = "yellow";
        };

        character = {
          success_symbol = "[](green)";
          error_symbol = "[](green)";
          vicmd_symbol = "[](purple)";
        };

        custom.direnv = {
          format = "[$symbol]($style)";
          symbol = "  ";
          style = "blue";
          when = "env | grep -E '^DIRENV_FILE='";
        };
      };
    };
  };
}
