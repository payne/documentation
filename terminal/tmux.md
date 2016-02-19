TMUX (Terminal Multiplexer)
============================

References
-----------
* [tmux website](https://tmux.github.io)
* [Vim and Tmux on your Mac](http://fideloper.com/mac-vim-tmux)
* [Installing tmux Linux](http://linoxide.com/how-tos/install-tmux-manage-multiple-linux-terminals/)
* [Tmux Shortcuts](https://gist.github.com/MohamedAlaa/2961058)

Install
-------
1. [Install *Vundle*](https://github.com/brandyn1bennett/documentation/blob/master/terminal/vundle.md)
2. [Install Solarized Theme](https://github.com/brandyn1bennett/documentation/blob/master/terminal/Vim-Solarized-Color-Theme.md)
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
tmux command key is `ctrl-b`

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