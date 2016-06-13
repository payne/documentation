ZShell
======

References
-----------
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Installing zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)

Install
-------
It may be installed already, but if it's not you can use a package manger

```zsh
brew install zsh
```

Make it your default shell

```zsh
chsh -s $(which zsh)
```

**Note:** If you are using LDAP `chsh` may not work, so you'll need have an admin add this for you or type `zsh` everytime you login

oh-my-zsh
---------
Add `oh-my-zsh` to get a bunch of useful features

```zsh
cd ~/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Configuration
-------------
All the configs will now be in `~/.zshrc`

Make `oh-my-zsh` update automatically by addint this to your `.zshrc`

```zsh
# Autoupdate automatically
DISABLE_UPDATE_PROMPT=true
```

Make sublime default editor except in ssh

```zsh
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  # Make sublime default editor
  export EDITOR='subl -w'
fi
```

set `DEFAULT_USER` to your username to get rid of "username@username" thing.

Make sure you add `$PATH:` to the beginning of the path as mentioned [here](https://stackoverflow.com/questions/27784961/received-warning-message-path-set-to-rvm-after-updating-ruby-version-using-rvm#answer)


