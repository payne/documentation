Vim Monokai Color Theme
==========================

References
-----------
* [Docs](https://github.com/crusoexia/vim-monokai)

Install
-------
1. [Install *Vundle*](https://github.com/brandyn1bennett/documentation/blob/master/vim/vundle.md)
2. Add the following to `~/.vim/config/VundleFile.vim`

Before `vundle#end()`
```VimL
" Add color theme
Plugin 'crusoexia/vim-monokai' 
```

After `vundle#end()`
```VimL
" Solarized Color Theme Settings
" -----------------------------
set number " Line numbers
syntax enable " Use syntax highlighting
set background=dark
colorscheme monokai
```

3. Run `:PluginInstall` in vim
