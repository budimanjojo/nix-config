vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

vim.go.mouse = 'a' -- Enable mouse support in all modes
vim.wo.number = true -- Show line numbers
vim.wo.relativenumber = true -- Relative line numbers
vim.go.modelines = 0 -- Turn off modelines
vim.wo.cursorline = true -- Highlight current line
vim.wo.list = true -- Display whitespace chars
vim.wo.listchars = 'tab:...,trail:_,extends:>,precedes:<,nbsp:~' -- Format of list
vim.wo.wrap = true -- Wrap lines on small screen
vim.go.whichwrap = 'b,s,<,>,h,l,[,]' -- Able to move line using these keys
vim.go.backspace = 'indent,eol,start' -- Fixes common backspace problem
vim.go.scrolloff = 5 -- Display 5 lines above/below the cursor when scrolling
vim.go.title = true -- Show title in terminal
vim.bo.matchpairs = '(:),{:},[:],<:>' -- Highlight matching pairs, use % to jump between
vim.go.hlsearch = true -- Incremental search highlight
vim.go.incsearch = true -- Incremental search highlight
vim.go.ignorecase = true -- Ignore case while searching
vim.go.smartcase = true -- Override ignorecase if using uppercase words
vim.go.history = 1000 -- History lines to be remembered
vim.go.wildmenu = true -- Better commandline completion
vim.go.cmdheight = 2 -- Height of commandline bar
vim.go.hidden = true -- Hide current buffer when opening new file to new buffer
vim.go.backup = false -- Disable creating backup file
vim.go.writebackup = false -- Disable creating backup file
vim.bo.swapfile = false -- Disable creating swapfile
vim.go.showmode = false -- Don't show current mode
vim.go.lazyredraw = true -- Don't redraw while executing macro for better performance
vim.go.showmatch = true -- Show matching brackets when cursor is over them
vim.go.splitbelow = true -- Open new split below
vim.go.splitright = true -- Open new vertical split on the right
vim.bo.expandtab = true -- Tabs are spaces
vim.go.smarttab = true -- Smarter tabs
vim.bo.shiftwidth = 2 -- 1 tab is 2 spaces
vim.bo.tabstop = 2 -- 1 tab is 2 spaces
vim.bo.autoindent = true -- Copy indentation from previous line when starting new line
vim.bo.smartindent = true -- Copy indentation from file being edited
vim.go.clipboard = 'unnamedplus' -- Use unnamedplus register
vim.wo.spell = true -- Enable spelling
vim.bo.spelllang = 'en_us' -- Spelling language

-- Temporary undodir
local undodir = '/tmp/.vim-undodir-' .. vim.env.USER
if vim.fn.isdirectory(undodir) ~= 1 then
  vim.fn.mkdir(undodir, 'p', '0700')
end
vim.go.undodir = undodir
vim.bo.undofile = true
