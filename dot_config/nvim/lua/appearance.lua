local o = vim.o
local cmd = vim.cmd
local fn = vim.fn

o.background = 'dark'   -- Dark background
o.termguicolors = true  -- Enable 256 colors
o.signcolumn = 'yes'    -- Always show signcolumn

-- Colorscheme
local theme_name = 'tokyonight.nvim'
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
if fn.isdirectory(packer_path .. theme_name) == 1 then
  vim.g.tokyonight_style = 'night'
  cmd('colorscheme tokyonight')
end

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]]

-- Floating window border color
cmd [[
  highlight! FloatBorder guifg=#C0CAF5
]]

-- nvim-cmp kind highlight
cmd [[
  highlight! CmpItemAbbrDeprecated gui=strikethrough guifg=#C0CAF5
  highlight! CmpItemAbbrMatch guifg=#7AA2F2
  highlight! CmpItemAbbrMatchFuzzy guifg=#7AA2F2
  highlight! CmpItemKindVariable guifg=#9ECE6A
  highlight! CmpItemKindInterface guifg=#9ECE6A
  highlight! CmpItemKindText guifg=#9ECE6A
  highlight! CmpItemKindFunction guifg=#F7768E
  highlight! CmpItemKindMethod guifg=#F7768E
  highlight! CmpItemKindSnippet guifg=#E0AF68
  highlight! CmpItemKindFile guifg=#E0AF68
  highlight! CmpItemKindKeyword guifg=#C0CAF5
  highlight! CmpItemKindProperty guifg=#C0CAF5
  highlight! CmpItemKindUnit guifg=#C0CAF5
]]
