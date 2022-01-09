local colors = {
  black = '#1D1F21',
  red = '#CC342B',
  green = '#198844',
  yellow = '#FBA922',
  blue = '#3971ED',
  magenta = '#A36AC7',
  cyan = '#3971ED',
  white = '#C5C8C6',
  gray = '#656565',
}

local custom_material =  {
  normal = {
    a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    c = { fg = colors.black, bg = colors.white, gui = 'bold' },
  },
  insert = {
    a = { fg = colors.black, bg = colors.green, gui = 'bold' },
    b = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    c = { fg = colors.black, bg = colors.white, gui = 'bold' },
  },
  visual = {
    a = { fg = colors.black, bg = colors.magenta, gui = 'bold' },
    b = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    c = { fg = colors.black, bg = colors.white, gui = 'bold' },
  },
  replace = {
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    b = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    c = { fg = colors.black, bg = colors.white, gui = 'bold' },
  },
  command = {
    a = { fg = colors.black, bg = colors.green, gui = 'bold' },
    b = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    c = { fg = colors.black, bg = colors.white, gui = 'bold' },
  },
  inactive = {
    a = { fg = colors.white, bg = colors.green, gui = 'bold' },
    b = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    c = { fg = colors.black, bg = colors.white, gui = 'bold' },
  },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_material,
    section_separators = { left = '', right = '' },
    component_separators = '',
    disabled_filetypes = { 'NvimTree' },
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
          modified = ' ',
          readonly = ' ',
          unnamed = ' ',
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
