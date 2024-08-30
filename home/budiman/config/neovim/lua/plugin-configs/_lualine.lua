require('lualine').setup {
  options = {
    globalstatus = false,
    icons_enabled = true,
    theme = 'catppuccin',
    section_separators = { left = '', right = '' },
    component_separators = '',
    disabled_filetypes = { 'oil' },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { left = '', right = '' },
      }
    },
    lualine_b = {
      {
        'branch',
        separator = { left = '', right = '' },
      }
    },
    lualine_c = {
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
      },
      {
        'diagnostics',
        sources = {
          'nvim_diagnostic'
        }
      },
      {
        'filename',
        path = 1,
        shorting_target = 30,
        symbols = {
          modified = ' 󰎜',
          readonly = ' 󰈡',
          unnamed = ' 󰎞',
        }
      }
    },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = {
      {
        'location',
        separator = { left = '', right = '' },
      }
    }
  },
  tabline = {
    lualine_b = {
      {
        'buffers',
        separator = { left = '', right = '' },
        show_modified_status = false,
        buffers_color = {
          active = 'lualine_b_normal',
          inactive = 'lualine_c_inactive',
        },
      }
    },
    lualine_z = {
      {
      'hostname',
        separator = { left = '', right = '' },
      }
    }
  },
}
