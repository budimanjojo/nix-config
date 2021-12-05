vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

vim.o.mouse = 'a' -- Enable mouse support in all modes
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbers
vim.o.modelines = 0 -- Turn off modelines
vim.o.cursorline = true -- Highlight current line
vim.o.list = true -- Display whitespace chars
vim.o.listchars = 'tab:...,trail:_,extends:>,precedes:<,nbsp:~' -- Format of list
vim.o.wrap = true -- Wrap lines on small screen
vim.o.whichwrap = 'b,s,<,>,h,l,[,]' -- Able to move line using these keys
vim.o.backspace = 'indent,eol,start' -- Fixes common backspace problem
vim.o.scrolloff = 5 -- Display 5 lines above/below the cursor when scrolling
vim.o.title = true -- Show title in terminal
vim.o.matchpairs = '(:),{:},[:],<:>' -- Highlight matching pairs, use % to jump between
vim.o.hlsearch = true -- Incremental search highlight
vim.o.incsearch = true -- Incremental search highlight
vim.o.ignorecase = true -- Ignore case while searching
vim.o.smartcase = true -- Override ignorecase if using uppercase words
vim.o.history = 1000 -- History lines to be remembered
vim.o.wildmenu = true -- Better commandline completion
vim.o.cmdheight = 2 -- Height of commandline bar
vim.o.hidden = true -- Hide current buffer when opening new file to new buffer
vim.o.backup = false -- Disable creating backup file
vim.o.writebackup = false -- Disable creating backup file
vim.o.swapfile = false -- Disable creating swapfile
vim.o.showmode = false -- Don't show current mode
vim.o.lazyredraw = true -- Don't redraw while executing macro for better performance
vim.o.showmatch = true -- Show matching brackets when cursor is over them
vim.o.splitbelow = true -- Open new split below
vim.o.splitright = true -- Open new vertical split on the right
vim.o.expandtab = true -- Tabs are spaces
vim.o.smarttab = true -- Smarter tabs
vim.o.shiftwidth = 2 -- 1 tab is 2 spaces
vim.o.tabstop = 2 -- 1 tab is 2 spaces
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
