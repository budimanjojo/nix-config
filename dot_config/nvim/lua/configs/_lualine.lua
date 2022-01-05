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
      a = { fg = colors.black, bg = colors.blue },
      b = { fg = colors.black, bg = colors.yellow },
      c = { fg = colors.black, bg = colors.white },
    },
    insert = {
      a = { fg = colors.black, bg = colors.green },
      b = { fg = colors.black, bg = colors.yellow },
      c = { fg = colors.black, bg = colors.white },
    },
    visual = {
      a = { fg = colors.black, bg = colors.magenta },
      b = { fg = colors.black, bg = colors.yellow },
      c = { fg = colors.black, bg = colors.white },
    },
    replace = {
      a = { fg = colors.black, bg = colors.red },
      b = { fg = colors.black, bg = colors.yellow },
      c = { fg = colors.black, bg = colors.white },
    },
    command = {
      a = { fg = colors.black, bg = colors.green },
      b = { fg = colors.black, bg = colors.yellow },
      c = { fg = colors.black, bg = colors.white },
    },
    inactive = {
      a = { fg = colors.white, bg = colors.green },
      b = { fg = colors.black, bg = colors.yellow },
      c = { fg = colors.black, bg = colors.white },
    },
  }

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_material
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
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
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { 'tabs' },
    lualine_b = {
      {
        'buffers',
        show_modified_status = false,
        buffers_color = {
          active = 'lualine_b_normal',
          inactive = 'lualine_c_inactive',
        },
      }
    },
    lualine_z = { 'hostname' }
  },
  extensions = {
    'nvim-tree',
  }
}
