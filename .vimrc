" VUNDLE PLUGINS {{{
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=/home/budiman/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'

" Color schemes
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()             " required
filetype plugin indent on     " required
"}}}

" VIM BUILT IN OPTIONS
set nocompatible
filetype plugin indent on
syntax on
set mouse=a
set whichwrap=b,s,<,>,[,]   " better arrow key cursor mapping
set relativenumber          " relative line number
set number                  " display current actual line number too
set linebreak               " only wrap at a character in breakat option
set hlsearch                " highlight search
set expandtab               " tab is spaces
set tabstop=2               " number of spaces in a tab
set shiftwidth=2            " number of spaces for indentation
set spell                   " enable spelling check
set noswapfile              " do not add .swapfile after editing file
set foldmethod=marker       " enable marker folding
set wildmenu
set title                   " show title in the terminal title bar
set wildignorecase          " ignore case in directory autocompletion
set ignorecase smartcase    " ignore case in searches, unless they contain upper-case letters
set background=dark
set t_Co=256
colorscheme badwolf
let mapleader = ","         " leader key is ','

" NEOVIM SPECIFIC OPTIONS
if !has('nvim')
  set ttymouse=xterm2
endif

if has('nvim')
  set clipboard=unnamedplus
endif

" PLUGIN OPTIONS GO HERE

" open up nerdtree file browser if no file is selected to be edited {{{
augroup nerdtree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END
" }}}

" vim-airline settings {{{
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
let g:airline_theme='base16_google'
set laststatus=2
" }}}

" syntastic settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" YCM functions {{{
set omnifunc=syntaxcomplete#Complete
" }}}

" MAPPINGS GO HERE

" Basic functions {{{
" Save, quit, save and quit
nmap <leader>w :w!<cr>
nmap <leader>q :qa!<cr>
nmap <leader>x :x<cr>
" Go to beginning and end of line
noremap B ^
noremap E $
" Toggle paste mode, paste using Ctrl+Shift+v inside paste mode will not add
" comments to the pasted content
set pastetoggle=<F2>
" }}}

" Tabbing and Splitting {{{
" Tabbing
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader><Right> :tabNext<cr>
map <leader><Left> :tabprevious<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Splitting
nmap <silent> <C-S-Up> :wincmd k<cr>
nmap <silent> <C-S-Down> :wincmd j<cr>
nmap <silent> <C-S-Left> :wincmd h<cr>
nmap <silent> <C-S-Right> :wincmd l<cr>
map <leader>sp :split<cr>
map <leader>vsp :vsplit<cr>
" }}}

" Move cursor intuitively, not by line number {{{
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
"}}}

" Copy and paste from X11 clipboard {{{
" http://vim.wikia.com/wiki/GNU/Linux_clipboard_copy/paste_with_xclip
" Requires xclip to be installed first
" Usage: select texts from Visual mode and press Ctrl+c to copy
" and Ctrl+v to paste (will disable default Visual Block mapping)
vmap <C-c> :!xclip -f -sel clip<CR>
map <C-v> mz:-1r !xclip -o -sel clip<CR>`z
"}}}

" AUTOCOMMANDS GO HERE

" Automatically re source vimrc when changes are done {{{
augroup autosource
  au!
  au BufWritePost .vimrc source ~/.vimrc
augroup END
" }}}

" Language specific default formatting for certain filetypes/file extentions. {{{
" http://dougblack.io/words/a-good-vimrc.html
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
