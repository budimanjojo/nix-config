local o = vim.o
local cmd = vim.cmd
local fn = vim.fn

o.background = 'dark'   -- Dark background
o.termguicolors = true  -- Enable 256 colors
o.signcolumn = 'yes'    -- Always show signcolumn

-- Colorscheme
local theme_name = 'nvim-base16'
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
if fn.isdirectory(packer_path .. theme_name) == 1 then
  cmd('colorscheme base16-google-dark')
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
  highlight! FloatBorder guifg=#4285F4
]]

-- nvim-cmp kind highlight
cmd [[
  highlight! CmpItemAbbrDeprecated gui=strikethrough guifg=#C5C8C6
  highlight! CmpItemAbbrMatch guifg=#4285F4
  highlight! CmpItemAbbrMatchFuzzy guifg=#4285F4
  highlight! CmpItemKindVariable guifg=#34A853
  highlight! CmpItemKindInterface guifg=#34A853
  highlight! CmpItemKindText guifg=#34A853
  highlight! CmpItemKindFunction guifg=#CC342B
  highlight! CmpItemKindMethod guifg=#CC342B
  highlight! CmpItemKindSnippet guifg=#FBBC05
  highlight! CmpItemKindFile guifg=#FBBC05
  highlight! CmpItemKindKeyword guifg=#FFFFFF
  highlight! CmpItemKindProperty guifg=#FFFFFF
  highlight! CmpItemKindUnit guifg=#FFFFFF
]]
