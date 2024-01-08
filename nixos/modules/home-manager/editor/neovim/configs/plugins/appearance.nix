{ pkgs, myPkgs, ... }:
let
  vimPlugins = pkgs.vimPlugins // myPkgs.nvim-plugins;
in
{
  config = {
    extraPlugins = with vimPlugins; [
      dressing-nvim
      guihua-lua
      nvim-web-devicons
    ];
    plugins = {
      lualine = {
        enable = true;
        globalstatus = false;
        theme = "tokyonight";
        sectionSeparators = {
          left = "";
          right = "";
        };
        componentSeparators = {
          left = "";
          right = "";
        };
        disabledFiletypes = {
          statusline = [ "oil" ];
          winbar = [ "oil" ];
        };
        sections = {
          lualine_a = [
            {
              name = "mode";
              separator = {
                left = "";
                right = "";
              };
            }
          ];
          lualine_b = [
            {
              name = "branch";
              separator = {
                left = "";
                right = "";
              };
            }
          ];
          lualine_c = [
            {
              name = "diff";
              extraConfig = {
                symbols = {
                  added = " ";
                  modified = " ";
                  removed = " ";
                };
              };
            }
            {
              name = "diagnostics";
              extraConfig = {
                sources = [
                  "nvim_diagnostic"
                ];
              };
            }
            {
              name = "filename";
              extraConfig = {
                path = 1;
                shorting_target = 30;
                symbols = {
                  modified = " 󰎜";
                  readonly = " 󰈡";
                  unnamed = " 󰎞";
                };
              };
            }
          ];
          lualine_x = [ "filetype" ];
          lualine_y = [ "progress" ];
          lualine_z = [
            {
              name = "location";
              separator = {
                left = "";
                right = "";
              };
            }
          ];
        };
        tabline = {
          lualine_b = [
            {
              name = "buffers";
              separator = {
                left = "";
                right = "";
              };
              extraConfig = {
                show_modified_status = false;
                buffers_color = {
                  active = "lualine_b_normal";
                  inactive = "lualine_c_inactive";
                };
              };
            }
          ];
          lualine_z = [
            {
              name = "hostname";
              separator = {
                left = "";
                right = "";
              };
            }
          ];
        };
      };
      indent-blankline = {
        enable = true;
      };
    };
  };
}
