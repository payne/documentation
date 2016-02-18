Vundle
============================
Vundle is a package/bundle/plugin manager for Vim

References
-----------
* [Vim and Tmux on your Mac](http://fideloper.com/mac-vim-tmux)

Install
--------
```bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

Configure
---------
```VimL
set nocompatible
filetype off    " Required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'    " Required

filetype plugin indent on " Required
```

Open a new instance of vim and run `:BundleInstall`
```bash
$ vim # Any file will do
:BundleInstall
```
