Get Syntastic Vim Linter
=========================

References
----------
* [Syntastic Docs](https://github.com/scrooloose/syntastic)

Install
-------
Make sure you have added [Vundle](https://github.com/brandyn1bennett/documentation/blob/master/vim/vundle.md)

In `~/.vim/config/VundleFile.vim` add the following
```VimL
" Add Syntastic Linter  
Plugin 'scrooloose/syntastic'
```

Run `:PluginInstall`

Configure
------------
Create `~/.vim/config/SyntasticFile.vim` and add the [recommended settings](https://github.com/scrooloose/syntastic#settings)

Also add this to not show the error window
```VimL
" Don't show the error window
let g:syntastic_auto_loc_list = 0
```

Pull it into `~/.vimrc` with
```VimL
runtime config/SyntasticFile.vim  
```
