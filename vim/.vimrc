" Vim Configurations
" ---------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" Pull in other vim configurations to keep
" this file clean
" http://rkrdo.github.io/2015/03/01/a-cleaner-vimrc/i
runtime config/VundleFile.vim 

" Editor Settings
" ----------------------
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set number " Line numbers
syntax enable " Use syntax highlighting

" Color Scheme Settings
" -----------------------
set background=dark
colorscheme monokai

" Syntastic Configurations
" https://github.com/scrooloose/syntastic
runtime config/SyntasticFile.vim 




