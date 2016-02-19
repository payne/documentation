Vim Solarized Color Theme
==========================

References
-----------
* [Vim and Tmux on your Mac](http://fideloper.com/mac-vim-tmux)

Install
-------
1. [Install *Vundle*](https://github.com/brandyn1bennett/documentation/blob/master/terminal/vundle.md)
2. Add the following to `~/.vimrc`

```VimL
" Add solarized color theme
Plugin 'altercation/vim-colors-solarized'
```
Before `vundle#end()`

After `vundle#end()`
```VimL
" Solarized Color Theme Settings
" -----------------------------
set number " Line numbers
syntax enable " Use syntax highlighting
set background=dark
let g:solarized_termcolors = 256  
colorscheme solarized
```
