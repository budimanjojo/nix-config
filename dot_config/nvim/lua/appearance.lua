vim.go.background = 'dark'   -- Dark background
vim.go.termguicolors = true  -- Enable 256 colors
vim.go.signcolumn = 'yes'    -- Always show signcolumn

-- Colorscheme
local theme_name = 'nvim-base16'
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
if vim.fn.isdirectory(packer_path .. theme_name) == 1 then
  vim.cmd('colorscheme base16-google-dark')
end
