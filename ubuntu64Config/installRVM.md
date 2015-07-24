Install RVM
=============

1. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/ubuntu64configBasics.md

2. Use the magical curl install script for the stable version
  
  ```bash
  curl -L https://get.rvm.io | bash -s stable
  ```

3. Close the terminal and reopen it or source the rvm script

  ```bash
  source ~/.rvm/scripts/rvm
  ```

4. Make the terminal run as a login shell, because RVM needs it to 
  * Open the terminal and go to Edit -> Profile Preferences -> Title and Commands
  * Check 'Run Command as a login shell'
  * Close and reopen the terminal
  * See https://rvm.io/integration/gnome-terminal for more details
