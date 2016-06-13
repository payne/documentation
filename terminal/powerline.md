Powerline
=========

References
-----------
* [Installing powerline](https://powerline.readthedocs.io/en/latest/installation.html)
* [Powerline github repo](https://github.com/powerline/powerline)
* [Install pip Redhat](http://sharadchhetri.com/2014/05/30/install-pip-centos-rhel-ubuntu-debian/)
* [iTerm2 Solarized](https://gist.github.com/kevin-smets/8568070)

Install
-------
### Linux
Make sure you have `pip` for `python`

Redhat
```zsh
sudo yum install -y python-pip
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
mv Downloads/fonts/Meslo/Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline.otf .fonts`

Download the font to Finder.

Open the font and "Install Font"

In iTerm go to Preferences->Profiles->Text and "Change Font" in "Font" and "Non-ASCII Font"
