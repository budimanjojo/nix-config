{
  config = {
    extraConfigLua = ''
      -- General options
      vim.cmd("filetype plugin indent on")
      vim.cmd("syntax enable")

      -- Temporary undodir
      local undodir = "/tmp/.vim-undodir-" .. vim.env.USER
      if vim.fn.isdirectory(undodir) ~= 1 then
        vim.fn.mkdir(undodir, "p", "0700")
      end
      vim.o.undodir = undodir
      vim.o.undofile = true
    '';
    options = {
      mouse = "a";                                              ## Enable mouse support in all modes
      number = true;                                            ## Show line numbers
      relativenumber = true;                                    ## Relative line numbers
      modelines = 0;                                            ## Turn off modelines
      cursorline = true;                                        ## Highlight current line
      list = true;                                              ## Display whitespace chars
      listchars = "tab:...,trail:_,extends:>,precedes:<,nbsp:~";## Format of list
      wrap = true;                                              ## Wrap lines on small screen
      whichwrap = "b,s,<,>,h,l,[,]";                            ## Able to move line using these keys
      backspace = "indent,eol,start";                           ## Fixes common backspace problem
      scrolloff = 5;                                            ## Display 5 lines above/below the cursor when scrolling
      matchpairs = "(:),{:},[:],<:>";                           ## Highlight matching pairs, use % to jump between
      hlsearch = true;                                          ## Incremental search highlight
      incsearch = true;                                         ## Incremental search highlight
      ignorecase = true;                                        ## Ignore case while searching
      smartcase = true;                                         ## Override ignorecase if using uppercase words
      history = 1000;                                           ## History lines to be remembered
      wildmenu = true;                                          ## Better commandline completion
      cmdheight = 0;                                            ## Height of commandline bar
      hidden = true;                                            ## Hide current buffer when opening new file to new buffer
      backup = false;                                           ## Disable creating backup file
      writebackup = false;                                      ## Disable creating backup file
      swapfile = false;                                         ## Disable creating swap file
      showmode = false;                                         ## Don't show current mode
      lazyredraw = true;                                        ## Don't redraw while executing macro for better performance
      showmatch = true;                                         ## Show matching brackets when cursor is over them
      splitbelow = true;                                        ## Open new split below
      splitright = true;                                        ## Open new vertical split on the right
      expandtab = true;                                         ## Tabs are spaces
      smarttab = true;                                          ## Smarter tabs
      shiftwidth = 2;                                           ## 1 tab is 2 spaces
      tabstop = 2;                                              ## 1 tab is 2 spaces
      autoindent = true;                                        ## Copy indentation from previous line when starting new line
      cindent = true;                                           ## Copy indentation from file being edited
      spell = true;                                             ## Enable spelling
      spelllang = "en_us";                                      ## Spelling language
    };
    clipboard = {
      register = "unnamedplus";                                 ## Use unnamedplus register
    };
  };
}
