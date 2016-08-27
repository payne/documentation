Install Latest Vim
==================

References
----------
* [OSX instructions](http://stackoverflow.com/questions/33198355/upgrade-to-vim-7-4-in-os-x-el-capitan)

OSX
---
```zsh
brew install vim
```

In `.zshrc`
```zsh
alias vim='/usr/local/bin/vim'
```

RedHat Linux
------------
Redhat doesn't come with the latest vim and the `yum` repos don't have it.
Instead, you can use the `rpm` package manager to install it from the
source files in these repos
```zsh
git clone https://github.com/runsisi/vim7.4-rpms-for-centos6.x
cd vim7.4-rpms-for-centos6.x
cd vim-7.4.160-1.el6.x86_64
sudo rpm -Uvh vim-common-7.4.160-1.el6.x86_64.rpm vim-filesystem-7.4.160-1.el6.x86_64.rpm vim-enhanced-7.4.160-1.el6.x86_64.rpm
```
