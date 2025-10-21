{
  config.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "catppuccin";
        globalstatus = false;
        icons_enabled = true;
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = "";
        disabled_filetypes = [ "oil" ];
      };

      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            separator = {
              left = "";
              right = "";
            };
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            separator = {
              left = "";
              right = "";
            };
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
          {
            __unkeyed-1 = "diagnostics";
            sources = [ "nvim_diagnostic" ];
          }
          {
            __unkeyed-1 = "filename";
            path = 1;
            shorting_target = 30;
            symbols = {
              modified = " 󰎜";
              readonly = " 󰈡";
              unnamed = " 󰎞";
            };
          }
        ];
        lualine_x = [ "filetype" ];
        lualine_y = [ "progress" ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
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
            __unkeyed-1 = "buffers";
            separator = {
              left = "";
              right = "";
            };
            show_modified_status = false;
            buffers_color = {
              active = "lualine_b_normal";
              inactive = "lualine_c_inactive";
            };
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "hostname";
            separator = {
              left = "";
              right = "";
            };
          }
        ];
      };
    };
  };
}
