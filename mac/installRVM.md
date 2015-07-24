Install RVM OSX
===============

1. Run the following code.  This will install rvm with the latest version of ruby, instruct rvm to automatically install library dependencies, and automatically add necessary code to `~/.bash_profile`

  ```bash
  curl -L https://get.rvm.io | bash -s stable --autolibs=enable --ruby
  ```

2. Add the following to `~/.bash_profile`

  ```bash
  # RVM
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  ```

3. Source `~/.bash_profile`

  ```bash
  source ~/.bash_profile
  ```
