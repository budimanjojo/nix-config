local custom_material = require('lualine.themes.material')

custom_material.normal.a.bg = '#3971ED'
custom_material.insert.a.bg = '#198844'
custom_material.visual.a.bg = '#A36AC7'
custom_material.replace.a.bg = '#CC342B'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_material
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', { 'diagnostics', sources={ 'nvim_lsp' }}},
    lualine_c = {{ 'filename', path = 1 }},
    lualine_x = { 'filetype', 'encoding', 'fileformat' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { 'tabs' },
    lualine_b = { 'buffers' },
    lualine_z = { 'hostname' }
  }
}
