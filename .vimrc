" VIM PLUG SETTINGS START HERE
set nocompatible                                               " Disable vi compability mode, must be on top

" Automatic installation for vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Plugins are defined here
Plug 'junegunn/vim-easy-align'                                  " Align text like this comment, use :EasyAlign# to align every #
Plug 'flazz/vim-colorschemes'                                   " Colorschemes collections
Plug 'chriskempson/base16-vim'                                  " Base16 colorshemes collections
Plug 'vim-airline/vim-airline'                                  " Statusline
Plug 'vim-airline/vim-airline-themes'                           " Themes for statusline
Plug 'scrooloose/nerdtree'                                      " NERDTree file manager
Plug 'Xuyuanp/nerdtree-git-plugin'                              " Git Integration for NERDTree
Plug 'tomtom/tcomment_vim'                                      " Comment out line with gcc or gc to target a motion
Plug 'tpope/vim-fugitive'                                       " Git wrapper for vim
Plug 'w0rp/ale'                                                 " Linting (syntax checking and semantic errors)
Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Intellisense engine for vim8 & neovim
Plug 'honza/vim-snippets'                                       " Snippets collections
Plug 'junegunn/fzf.vim'                                         " Fuzzy finder for vim
Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()

" Required
filetype plugin indent on                                      " Enable support for autocmds and plugins to work
syntax enable                                                  " Enable syntax highlighting
" VIM PLUG SETTINGS END HERE

" VIM BASIC SETTINGS START HERE
" Neovim specific options
if !has('nvim')
  set ttymouse=xterm2
endif

if has('nvim')
  set clipboard=unnamedplus
endif

" General Settings
set mouse=a                                              " Enable mouse usage (all modesp)
set foldmethod=marker                                    " Fold code by markers (default is set {{{,}}})
set modelines=0                                          " Turn off modelines (security reason)
set number                                               " Show line numbers
set relativenumber                                       " Relative line numbers
set cursorline                                           " Highlight current line
set list                                                 " Display whitespace characters
set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~ " Format for whitespace characters
set novisualbell                                         " Use visual bell instead of beeping when doing something wrong
set laststatus=2                                         " Always show Status bar
set encoding=utf-8                                       " Encoding
set wrap                                                 " Wrap lines when the screen is too small
set whichwrap+=<,>,h,l,[,]                               " Able to move line using cursor left right
set backspace=indent,eol,start                           " Fixes common backspace problems
set ttyfast                                              " Speed up scrolling in Vim
set scrolloff=5                                          " Display 5 lines above/below the cursor when scrolling with a mouse
set title                                                " Show title in the terminal title bar
set matchpairs+=<:>                                      " Highlight matching pairs of brackets. Use the '%' character to jump between them.
set hlsearch                                             " Highlight matching search patterns
set incsearch                                            " Enable incremental search
set ignorecase                                           " Include matching uppercase words with lowercase search term
set smartcase                                            " Include only uppercase words with uppercase search term
set history=1000                                         " Set how many history line to be remembered
set wildmenu                                             " Make command-line completion better
set cmdheight=2                                          " Height of command bar
set hidden                                               " If hidden is not set, TextEdit might fail
set nobackup                                             " Disable creating backup file like file~
set nowritebackup                                        " Disable creating backup file like file~
set noswapfile                                           " Disable creating swap file like file.swap
set showmode                                             " Show which mode we are in
set lazyredraw                                           " Don't redraw while executing macros (better performance)
set showmatch                                            " Show matching brackets when text indicator is over them
set splitbelow                                           " Open new splits below by default
set splitright                                           " Open new vertical split on the right by default
set formatoptions-=cro                                   " Don't wrap my comments, I'll do it myself

" Use persistent history
if !isdirectory("/tmp/.vim-undo-dir-". $USER)
  call mkdir("/tmp/.vim-undo-dir-". $USER, "", 0700)
endif
set undodir=/tmp/.vim-undo-dir-$USER
set undofile

" Eye Candy
set background=dark                                      " Background to be dark
set t_Co=256                                             " Enable 256 colors
set termguicolors                                        " Enable 24-bit RGB colors in TUI
silent! colorscheme base16-google-dark                   " Colorscheme theme (Silent added to ignore error message on install script)
set signcolumn=yes                                       " Always show signcolumns

" Tabbing and Text Indent
set expandtab                                            " Tabs are spaces
set smarttab                                             " Smarter tabs handling
set shiftwidth=4                                         " 1 tab is 4 spaces
set tabstop=4                                            " 1 tab is 4 spaces
set autoindent                                           " Copy indentation from previous line when starting new line
set smartindent                                          " Copy indentation from file being edited
" VIM BASIC SETTINGS END HERE

" PLUGINS SETTINGS START HERE
" Vim Airline
let g:airline_theme = 'base16_google'         " Airline Theme
let g:airline_powerline_fonts = 1             " Use Powerline fonts
let g:airline_skip_empty_sections = 1         " Do not draw separators for empty sections
let g:airline#extensions#tabline#enabled = 1  " Automatically display all buffers when there's only one tab open
let g:airline#exteensions#ale#enabled = 1     " Show errors or warnings from ALE

" NERDTree
let g:NerdtreeWinSize = 20                    " NERDTree Window Size
let NERDTreeShowHidden = 1                    " Show hidden files by default

" Emmet
let g:user_emmet_install_global = 0           " Disable Emmet by default

" COC
set updatetime=300                            " Make linting faster
" Extensions for COC to be installed
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-highlight',
  \ 'coc-tsserver',
  \ 'coc-tslint',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-phpls',
  \ 'coc-stylelint',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ 'coc-emmet',
  \]
" PLUGINS SETTINGS END HERE

" BASIC MAPPINGS START HERE
"Leader is spacebar
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" Fast save, save and quit, force exit all documents
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qa :qa!<CR>
nnoremap <Leader>wq :wq<CR>

" Better cursor movement on wrapped line
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
nnoremap <Up> gk
nnoremap <Down> gj
vnoremap <Up> gk
vnoremap <Down> gj
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj

" Map Y to yank from cursor to end of line
nnoremap Y y$

" ii to exit Insert mode
inoremap ii <C-[>
onoremap ii <C-[>

" K and J to move up and down paragraph, H and L to move first and last
" character in line
noremap K {
noremap J }
noremap H ^
noremap L $

" In normal mode use Control+hjkl to move between splits
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" In normal mode use Leader+s and Leader+v to open new horizontal or vertical split
nnoremap <Leader>s :new<CR>
nnoremap <Leader>v :vnew<CR>

" In insert mode use Control+hjkl to move cursors
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Tab navigation
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>th :tabprev<CR>
nnoremap <Leader>tl :tabnext<CR>

" Open new tab with current buffer's path
nnoremap <Leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" Tab and Shift+Tab to indent or de-indent in Normal or Visual mode
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <tab> >gv
vnoremap <S-Tab> <gv

" Use Leader+h to toggle search highlight
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Press F5 to strip whitespaces in file
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" BASIC MAPPINGS END HERE

" PLUGIN MAPPINGS START HERE
" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <silent> ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <silent> ga <Plug>(EasyAlign)

" NERDTree
" Control + n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" ALE
" Navigate arround errors
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

" COC
" Press Tab and Shift+Tab and navigate around completion selections
function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "\<S-Tab>" :
  \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Press Enter to select completion items or expand snippets
inoremap <silent><expr> <CR>
  \ pumvisible() ? "\<C-y>" :
  \ "\<C-g>u\<CR>"

" Show diagnostic message of current position, no truncate
nmap <Leader>ci <Plug>(coc-diagnostic-info)
" Jump to next diagnostic position
nmap <Leader>jn <Plug>(coc-diagnostic-next)
" Jump to previous diagnostic position
nmap <Leader>jp <Plug>(coc-diagnostic-prev)
" Jump to definition(s) of current symbol
nmap <Leader>jd <Plug>(coc-definition)
" Jump to declaration(s) of current symbol
nmap <Leader>jc <Plug>(coc-declaration)
" Jump to implementation(s) of current symbol
nmap <Leader>ji <Plug>(coc-implementation)
" Jump to type definition(s) of current symbol
nmap <Leader>jt <Plug>(coc-type-definition)
" Jump to references of current symbol
nmap <Leader>jr <Plug>(coc-references)
" Format selected range (in a motion when in normal mode)
vmap <Leader>cf <Plug>(coc-format-selected)
nmap <Leader>cf <Plug>(coc-format-selected)
" Rename symbol under cursor to a new word
nmap <Leader>cr <Plug>(coc-rename)
" Open link under cursor
nmap <Leader>cl <Plug>(coc-openlink)

" COC Snippets
" Use Alt+n to jump to next snippet placeholder
let g:coc_snippet_next = '<M-n>'
" Use Alt+p to jump to previous snippet placeholder
let g:coc_snippet_prev = '<M-p>'

" FZF
" Leader+f to fuzzy file search
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fw :Windows<CR>
nnoremap <silent> <Leader>fl :BLines<CR>
nnoremap <silent> <Leader>fh :History<CR>

" PLUGIN MAPPINGS END HERE

" AUTOCOMMANDS START HERE
" Automatically re source vimrc when changes are done
augroup AutoSource
  autocmd!
  autocmd BufWritePost .vimrc source ~/.vimrc | setlocal filetype=vim
augroup END

" Open up NERDTree file browser if no file is selected to be edited
augroup NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END

" Automatically save folds state and position on exit and load them again when file opened
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave *.* mkview
"   autocmd BufWinEnter *.* silent! loadview
" augroup END

augroup FileTypeSettings
  autocmd!
  autocmd FileType java,php,css,html,xml, setlocal noexpandtab
  autocmd FileType vim,yaml setlocal shiftwidth=2
  autocmd FileType vim,yaml setlocal tabstop=2
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd FileType json let g:indentLine_setConceal=0
  autocmd FileType html,css,php EmmetInstall
augroup END

augroup UnknownFileType
  autocmd!
  autocmd BufRead,BufNewFile *.twig set syntax=html filetype=html
  autocmd BufRead,BufNewFile *.cls set syntax=java filetype=java
  autocmd BufRead,BufNewFile *.zsh-theme set syntax=zsh filetype=zsh
  autocmd BufRead,BufNewFile *.yml,yarn.lock set syntax=yaml filetype=yaml
augroup END

" Hide statusline when using FZF
augroup FZF
  autocmd!
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" Templates
augroup K8S
  autocmd!
  autocmd BufNewFile deployment.yaml 0r ~/.vim/templates/deployment.yaml
  autocmd BufNewFile service.yaml 0r ~/.vim/templates/service.yaml
  autocmd BufNewFile pvc.yaml 0r ~/.vim/templates/pvc.yaml
  autocmd BufNewFile configmap.yaml 0r ~/.vim/templates/configmap.yaml
  autocmd BufNewFile secret.yaml 0r ~/.vim/templates/secret.yaml
  autocmd BufNewFile ingress-traefikCRD.yaml 0r ~/.vim/templates/ingress-traefikCRD.yaml
" AUTOCOMMANDS END HERE

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
