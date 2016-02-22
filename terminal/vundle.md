Vundle
============================
Vundle is a package/bundle/plugin manager for Vim

References
-----------
* [Vundle docs](https://github.com/VundleVim/Vundle.vim)
* [Vim and Tmux on your Mac](http://fideloper.com/mac-vim-tmux)
* [A Cleaner vimrc](http://rkrdo.github.io/2015/03/01/a-cleaner-vimrc/)

Install
--------
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Configure
---------
Add the configuration less the plugins you want from the [Vundle docs](https://github.com/VundleVim/Vundle.vim) to your `~/.vimrc`

However you'll want to move all the Vundle related configs into their own `VundleFile.vim` inside the `~/.vim/config` and pull it into `~/.vimrc` with this code:  
```VimL
if filereadable(expand("~/.vim/config/VundleFile.vim")) 
  source ~/.vim/config/VundleFile.vim
endif
```
This code will make it so there aren't issues with loading plugins when doing git commit messages

Open a new instance of vim and run `:PluginInstall`
```bash
$ vim # Any file will do
:PluginInstall
```
