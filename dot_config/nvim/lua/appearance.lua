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
  highlight! FloatBorder guifg=#3971ED
]]

-- nvim-cmp kind highlight
cmd [[
  highlight! CmpItemAbbrDeprecated gui=strikethrough guifg=#C5C8C6
  highlight! CmpItemAbbrMatch guifg=#3971ED
  highlight! CmpItemAbbrMatchFuzzy guifg=#3971ED
  highlight! CmpItemKindVariable guifg=#198844
  highlight! CmpItemKindInterface guifg=#198844
  highlight! CmpItemKindText guifg=#198844
  highlight! CmpItemKindFunction guifg=#CC342B
  highlight! CmpItemKindMethod guifg=#CC342B
  highlight! CmpItemKindSnippet guifg=#FBA922
  highlight! CmpItemKindFile guifg=#FBA922
  highlight! CmpItemKindKeyword guifg=#FFFFFF
  highlight! CmpItemKindProperty guifg=#FFFFFF
  highlight! CmpItemKindUnit guifg=#FFFFFF
]]
