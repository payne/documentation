Separate Vim Configuration Files
==================================

`.vimrc` files can get long with lots of configurations so it's to separate out related configurations into their own files

References
-----------
* [A Cleaner vimrc](http://rkrdo.github.io/2015/03/01/a-cleaner-vimrc/)

Setup
-------
Create a `config` folder inside of `~/.vim/`
```bash
mkdir ~/.vim/config
```

Make a new file in `config` for each of your config files with the extension `.vim`

In your `~/.vimrc` add this to pull the file in
```VimL
runtime config/ConfigFile.vim
```



