" vim builtin options
set nocompatible
filetype plugin indent on
syntax on
set mouse=a
set whichwrap=b,s,<,>,[,]   " better arrow key cursor mapping
set number                  " line number
set linebreak               " only wrap at a character in breakat option
set hlsearch                " highlight search
set expandtab               " tab is spaces
set tabstop=2               " number of spaces in a tab
set shiftwidth=2            " number of spaces for indentation
set spell                   " enable spelling check
set noswapfile              " do not add .swapfile after editing file
set wildmenu
set wildignorecase          " ignore case in directory autocompletion
set ignorecase smartcase    " ignore case in searches, unless they contain upper-case letters
set background=dark
set t_Co=256
colorscheme default
let mapleader = ","         " leader key is ','

" set the runtime path to include Vundle and initialize
set rtp+=/home/budiman/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()             " required
filetype plugin indent on     " required

" plugin functions goes here

" open up nerdtree file browser if no file is selected to be edited
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim-airline settings
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
let g:airline_theme='base16_google'
set laststatus=2

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YCM functions
set omnifunc=syntaxcomplete#Complete

" MAPPINGS GOES HERE

" Basic functions
nmap <leader>w :w!<cr>
nmap <leader>q :qa!<cr>
nmap <leader>x :x<cr>

" Tabbing
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader><Right> :tabNext<cr>
map <leader><Left> :tabprevious<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move cursor intuitively, not by line number
nnoremap <buffer> <Up> gk
nnoremap <buffer> <Down> gj
nnoremap <Down> gj
nnoremap <Up> gk
inoremap <buffer> <Up> <C-O>gk
inoremap <buffer> <Down> <C-O>gj
vnoremap <buffer> <Up> gk
vnoremap <buffer> <Down> gj
nnoremap <buffer>j gj
nnoremap <buffer>k gk

