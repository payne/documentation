Powerline
=========

References
-----------
* [Installing powerline](https://powerline.readthedocs.io/en/latest/installation.html)
* [Powerline github repo](https://github.com/powerline/powerline)
* [Install pip Redhat](http://sharadchhetri.com/2014/05/30/install-pip-centos-rhel-ubuntu-debian/)
* [iTerm2 Solarized](https://gist.github.com/kevin-smets/8568070)
* [Installing Powerline](http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)

Install
-------
### Linux
Make sure you have `pip` for `python`

Redhat
```zsh
sudo yum install -y python-pip
```

Install `argparse` if you have a python version less than 2.7
```zsh
sudo yum install python-argparse
```

Make a fonts directory
```zsh
mkdir ~/.fonts/
```

Move your font to the fonts directory
```zsh
cd ~/Downloads/
git clone https://github.com/powerline/fonts.git
mv Downloads/fonts/Meslo/Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline.otf .fonts

# Add the font to the cache
fc-cache -vf ~/.fonts/
```

### OSX
Navigate to `https://github.com/powerline/fonts.git

Download the font to Finder.

Open the font and "Install Font"

In iTerm go to Preferences->Profiles->Text and "Change Font" in "Font" and "Non-ASCII Font"

### Vim
Create a new config file
```zsh
touch ~/.vim/config/powerline.vim
```

Add the following to it
```VimL
" Install powerline
" @see http://powerline.readthedocs.io/en/master/usage/other.html
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Always show statusline
set laststatus=2
```

Add this to your `.vimrc`
```VimL
" Powerline Configuration
runtime config/powerline.vim
```

### Tmux
Add the following to `~/.tmux.conf`
```zsh
# Use powerline
run-shell "powerline-daemon -q"
source "/usr/lib/python2.6/site-packages/powerline/bindings/tmux/powerline.conf"
```

Kill all sessions and start tmux over