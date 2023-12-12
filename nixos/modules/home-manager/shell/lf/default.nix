{ pkgs, lib, config, ... }:
with lib;
let cfg = config.hm-modules.shell.lf;
in {
  options.hm-modules.shell.lf = { enable = mkEnableOption "lf"; };

  config = mkIf cfg.enable {
    xdg.configFile."lf/colors".source = ./configs/colors;
    xdg.configFile."lf/icons".source = ./configs/icons;
    programs.lf = {
      enable = true;
      keybindings = {
        "D" = "delete";
        "n" = "";
        "nd" = "push :newdir<space>";
        "nf" = "push :newfile<space>";
        "gf" = ":fzf_search";
        "gz" = "push :z<space>";
      };
      extraConfig = ''
        # previews
        set previewer ${pkgs.ctpv}/bin/ctpv
        set cleaner ${pkgs.ctpv}/bin/ctpvclear
        &${pkgs.ctpv}/bin/ctpv -s $id
        &${pkgs.ctpv}/bin/ctpvquit $id

        cmd newdir %{{
          ${pkgs.coreutils}/bin/mkdir "$@"
          lf -remote "send $id select \"$@\""
        }}

        cmd newfile %{{
          ${pkgs.coreutils}/bin/touch "$@"
          lf -remote "send $id select \"$@\""
        }}

        # zoxide
        cmd z %{{
          result="$(${pkgs.zoxide}/bin/zoxide query --exclude $PWD $@)"
          lf -remote "send $id cd \"$result\""
        }}

        # fzf with ripgrep
        cmd fzf_search ''${{
          res="$( \
            RG_PREFIX="${pkgs.ripgrep}/bin/rg --column --line-number --no-heading --color=always \
              --smart-case "
            FZF_DEFAULT_COMMAND="$RG_PREFIX '''" \
              ${pkgs.fzf}/bin/fzf --bind "change:reload:$RG_PREFIX {q} || true" \
              --ansi --layout=reverse --header 'Search in files' \
              | cut -d':' -f1
          )"
          [ ! -z "$res" ] && lf -remote "send $id select \"$res\""
        }}

        # opening files
        cmd open ''${{
          case $(${pkgs.file}/bin/file --mime-type -Lb "$f") in
            # text files
            text/*|application/json)
              $EDITOR "$fx";;

            # archive files
            application/x-bzip*|application/*zip|application/x-xz|application/x-rar|application/x-*-image)
              mntdir="$f-archivemount"
              [ ! -d "$mntdir" ] && {
                mkdir "$mntdir"
                ${pkgs.archivemount}/bin/archivemount "$f" "$mntdir"
                echo "$mntdir" >> "/tmp/__lf_archivemount_$id"
              }
              lf -remote "send $id cd \"$mntdir\""
              lf -remote "send $id reload"
              ;;
          esac
        }}

        # umount archives on quit
        cmd on-quit ''${{
          archivemount_dir="/tmp/__lf_archivemount_$id"
          if [ -f "$archivemount_dir" ]; then
            cat "$archivemount_dir" | \
              while read -r line; do
                /run/wrappers/bin/sudo ${pkgs.umount}/bin/umount "$line"
                ${pkgs.coreutils}/bin/rmdir "$line"
              done
            rm -f "$archivemount_dir"
          fi
        }}

        # dynamically set number of columns
        ''${{
          w=$(${pkgs.ncurses}/bin/tput cols)
          if [ "$w" -le 80 ]; then
            lf -remote "send $id set ratios 1:2"
          elif [ "$w" -le 160 ]; then
            lf -remote "send $id set ratios 1:2:3"
          else
            lf -remote "send $id set ratios 1:2:3:5"
          fi
        }}
      '';
      settings = {
        icons = true;
        drawbox = true;
      };
    };

    home.packages = with pkgs; [
      chafa
      poppler_utils
      ffmpegthumbnailer
    ];
  };
}
