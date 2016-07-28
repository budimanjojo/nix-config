" vim builtin options
set nocompatible
filetype plugin indent on
syntax on
set mouse=a
set whichwrap=b,s,<,>,[,]	" better arrow key cursor mapping
set number			" line number
set spell
set noswapfile			" do not add .swapfile after editing file
set wildmenu
set wildignorecase		" ignore case in directory autocompletion
set ignorecase smartcase	" ignore case in searches, unless they contain upper-case letters

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

" plugin functions goes here

" open up nerdtree file browser if no file is selected to be edited
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim-airline settings
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
let g:airline_theme='base16_flat'
