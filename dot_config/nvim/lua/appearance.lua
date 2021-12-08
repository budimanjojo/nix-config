vim.go.background = 'dark'   -- Dark background
vim.go.termguicolors = true  -- Enable 256 colors
vim.go.signcolumn = 'yes'    -- Always show signcolumn

-- Colorscheme
local theme_name = 'nvim-base16'
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
if vim.fn.isdirectory(packer_path .. theme_name) == 1 then
  vim.cmd('colorscheme base16-google-dark')
end
-- nvim-cmp kind highlight
vim.cmd([[
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
]])
