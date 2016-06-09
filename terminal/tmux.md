TMUX (Terminal Multiplexer)
============================

References
-----------
* [tmux website](https://tmux.github.io)
* [Vim and Tmux on your Mac](http://fideloper.com/mac-vim-tmux)
* [Installing tmux Linux](http://linoxide.com/how-tos/install-tmux-manage-multiple-linux-terminals/)
* [Tmux Shortcuts](https://gist.github.com/MohamedAlaa/2961058)
* [Tmux Redhat Script](https://gist.github.com/rothgar/cecfbd74597cc35a6018)
* [iTerm tmux Integration](https://gitlab.com/gnachman/iterm2/wikis/TmuxIntegration)

Install
-------
1. [Install *Vundle*](https://github.com/brandyn1bennett/documentation/blob/master/vim/vundle.md)
2. [Install Monokai Theme](https://github.com/brandyn1bennett/documentation/blob/master/vim/Vim-Monokai-Theme.md)
3. Install tmux

Mac:
```bash
brew install tmux
```

Debian/Ubuntu
```bash
sudo apt-get install tmux
```

Redhat
```bash
yum install -y -v tmux
# This may take a while 
```

### Install latest version in RedHat

Use this script:

```bash
  # Install tmux on Centos release 6.5

  # install deps
  yum install gcc kernel-devel make ncurses-devel

  # DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
  wget https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
  tar -xvzf libevent-2.0.22-stable.tar.gz
  cd libevent-2.0.22-stable
  ./configure --prefix=/usr/local
  make
  sudo make install

  # DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL
  wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz
  tar -xvzf tmux-2.2.tar.gz
  cd tmux-2.2
  export LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" 
  autoreconf -f -i
  ./configure --prefix=/usr/local
  make
  sudo make install

  # pkill tmux
  # close your terminal window (flushes cached tmux executable)
  # open new shell and check tmux version
  tmux -V
```

### Use with iTerm Panes

Make sure you install tmux greater than 1.8.

You can ssh into a box with iTerm and run `tmux -CC` or `tmux -CC a` to get into a tmux session that will allow you to use iTerm panes.  This is much easier than using tmux panes and makes copy and pasting easier.

Configure
---------
Make/Edit a `~/.tmux.conf` file

Add this to it to fix color issues
```Shell
# Fix color issues
set -g default-terminal "screen-256color"
```

Use
---------
### Outside of tmux
Start a session with a session name
```bash
tmux new -s session-name
```

Attach to a session
```bash
tmux a -t session-name
```

List session
```bash
tmux ls
```

Kill session
```bash
tmux kill-session -t session-name
```

### In tmux
tmux command/prefix key is `ctrl-b`

#### Change Prefix
Add the following to `~/.tmux.conf`
```bash
set -g prefix C-a
unbind-key C-b
bind-key C-a send-prefix
```

You can still use `Ctrl-a` to get to the beginning of a line if you type `Ctrl-aa`.  *You need to hold `Ctrl-a` down while pressing the second `a`*

#### Sessions
```
d #detach from session
s #list sessions
```

#### Windows
Close current window
```
c #create window
& #kill window
w #list windows
n #next window
p #previous window
```

#### Panes
```
% #vertical split
" #horizontal split
q #show pane numbers.  When the numbers show up press the number to go to that pane
x #kill pane
o #swap panes
{ #Move current pane left
} #Move current pane right
```

#### Copy Mode
```
[ #enter copy mode
SPACE #begin copying
ENTER #stop copying
] #paste
ESC #exit copy mode
```

Use `vi` bindings by adding this to `~/.tmux.conf`
```Shell
# Enable vi key bindings in Copy Mode
setw -g mode-keys vi     
```

Detach from the session and run
```bash
tmux source-file ~/.tmux.conf
```
