local cmd = vim.cmd
local o = vim.o
local fn = vim.fn

cmd('filetype plugin indent on')
cmd('syntax enable')

o.mouse = 'a'                                                -- Enable mouse support in all modes
o.number = true                                              -- Show line numbers
o.relativenumber = true                                      -- Relative line numbers
o.modelines = 0                                              -- Turn off modelines
o.cursorline = true                                          -- Highlight current line
o.list = true                                                -- Display whitespace chars
o.listchars = 'tab:...,trail:_,extends:>,precedes:<,nbsp:~'  -- Format of list
o.wrap = true                                                -- Wrap lines on small screen
o.whichwrap = 'b,s,<,>,h,l,[,]'                              -- Able to move line using these keys
o.backspace = 'indent,eol,start'                             -- Fixes common backspace problem
o.scrolloff = 5                                              -- Display 5 lines above/below the cursor when scrolling
o.matchpairs = '(:),{:},[:],<:>'                             -- Highlight matching pairs, use % to jump between
o.hlsearch = true                                            -- Incremental search highlight
o.incsearch = true                                           -- Incremental search highlight
o.ignorecase = true                                          -- Ignore case while searching
o.smartcase = true                                           -- Override ignorecase if using uppercase words
o.history = 1000                                             -- History lines to be remembered
o.wildmenu = true                                            -- Better commandline completion
o.cmdheight = 2                                              -- Height of commandline bar
o.hidden = true                                              -- Hide current buffer when opening new file to new buffer
o.backup = false                                             -- Disable creating backup file
o.writebackup = false                                        -- Disable creating backup file
o.swapfile = false                                           -- Disable creating swapfile
o.showmode = false                                           -- Don't show current mode
o.lazyredraw = true                                          -- Don't redraw while executing macro for better performance
o.showmatch = true                                           -- Show matching brackets when cursor is over them
o.splitbelow = true                                          -- Open new split below
o.splitright = true                                          -- Open new vertical split on the right
o.expandtab = true                                           -- Tabs are spaces
o.smarttab = true                                            -- Smarter tabs
o.shiftwidth = 2                                             -- 1 tab is 2 spaces
o.tabstop = 2                                                -- 1 tab is 2 spaces
o.autoindent = true                                          -- Copy indentation from previous line when starting new line
o.cindent = true                                             -- Copy indentation from file being edited
o.clipboard = 'unnamedplus'                                  -- Use unnamedplus register
o.spell = true                                               -- Enable spelling
o.spelllang = 'en_us'                                        -- Spelling language

-- Temporary undodir
local undodir = '/tmp/.vim-undodir-' .. vim.env.USER
if fn.isdirectory(undodir) ~= 1 then
  fn.mkdir(undodir, 'p', '0700')
end
o.undodir = undodir
o.undofile = true
