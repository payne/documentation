" Vundle Configurations
" ---------------------------
" https://github.com/VundleVim/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add Syntastic Linter
Plugin 'scrooloose/syntastic'

" Add color theme
" Plugin 'altercation/vim-colors-solarized'
Plugin 'crusoexia/vim-monokai'

" Add CSS3 Syntax Highlighting
Plugin 'hail2u/vim-css3-syntax'

" Add SASS Syntax Highlighting
Plugin 'cakebaker/scss-syntax.vim'

" Markdown Highlighting
Plugin 'gabrielelana/vim-markdown'

" Handlebars
Plugin 'mustache/vim-mustache-handlebars'

" File Explorer
Plugin 'scrooloose/nerdtree'

" Fuzzy File Finder
Plugin 'ctrlpvim/ctrlp.vim'

" Commenter
Plugin 'scrooloose/nerdcommenter'

" JSDoc
Plugin 'heavenshell/vim-jsdoc'

" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Automatic spacing detecting
Plugin 'tpope/vim-sleuth'

" Better javascript support
Plugin 'pangloss/vim-javascript'

" Surrounding parens, brackets, etc.
Plugin 'tpope/vim-surround'

" Scala highlighting
Plugin 'derekwyatt/vim-scala'

" Git support in Vim
Plugin 'tpope/vim-fugitive.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
