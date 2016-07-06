" Vim Configurations
" ---------------------
set nocompatible              " be iMproved, required
filetype on                  " required

" Change the leader key so all the loaded plugins get the right binding
let mapleader = ","

" Pull in other vim configurations to keep
" this file clean
" http://rkrdo.github.io/2015/03/01/a-cleaner-vimrc
runtime config/VundleFile.vim

" Editor Settings
" ----------------------
" Enable filetype plugins
filetype plugin on
filetype indent on

" Allow hidden buffers
set hid

" Enable unicode
set encoding=utf-8

" Increase command history
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Make sure the current mode is shown
set showmode

" Show info about the current command happening
set showcmd

" Show the cursor position
set ruler

" Highlight text that exceeds line length
set colorcolumn=100

" Don't wrap lines
set nowrap

" Backspace like other editors
set backspace=indent,eol,start

" scroll before the cursor reaches the bottom/top
set scrolloff=3

" Enable nicer tab completion for commands
set wildmenu
set wildmode=list:longest
set wildignore+=**/tmp,*.so,*.swp,*.zip,*/.git,**/build,**/dist,**/.eyeglass_cache,**/.gradle

" Show line numbers
set number

" Highlight the line the cursor is on
set cursorline

" Searching
" -----------
" Case insensitive search
set ignorecase

" Will search for exact match if uppercase letters are found
set smartcase

" Move cursor to the next match while searching
set incsearch

" Briefly jump to matching bracket when one is entered
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Highlight search matches
set hlsearch

" Indenting
" ----------
" Insert spaces for tabs
set expandtab

" Number of spaces for tab
set tabstop=2

" Change number os characters for indenting
set shiftwidth=2

" Insert/delete correct number of spaces with shift and backspace
set softtabstop

" Copy indentation from previous line
set autoindent

" Color Scheme Settings
" -----------------------
set background=dark
colorscheme monokai

" Turn backup off, since most stuff is in SVN, git, etc. anyway...
set nobackup
set nowb
set noswapfile

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Set working directory to current file's directory
autocmd BufEnter * lcd %:p:h

" Set scala file type, because it doesn't happen automatically for some reason
autocmd BufRead,BufNewFile *.scala set filetype=scala

" Plugin Settings
" ---------------
" Syntastic Configurations
" https://github.com/scrooloose/syntastic
runtime config/SyntasticFile.vim

" Airline Configuration
runtime config/airline.vim

" NerdTree Configurations
runtime config/nerdtree.vim

" NerdCommenter Settings
runtime config/nerdcommenter.vim

" NerdCommenter Settings
runtime config/ctrlp.vim

" Key bindings
runtime config/keybindings.vim
