Installing Sublime Text 2 on Ubuntu 64-bit
===========================================

1. Install sublime text 2
  * Add a new repo to apt-get, update it, and install it
   
  ```bash
  sudo add-apt-repository ppa:webupd8team/sublime-text-2
  sudo apt-get update
  sudo apt-get install sublime-text
  ```
  * Go to Preferences -> Settings-User and copy the Sublime configuration settings in from https://github.com/brandyn1bennett/documentation/blob/master/sublimeSettings/Preferences.sublime-settings

2. Copy sublime settings to documentation folder
  
  ```bash
  sudo cp ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings Development/Infrastructure/documentation/sublimeSettings/
  ```

2. Add subl command
  * Create a symlink from sublime text 2 to /usr/local/bin
    
  ```bash
  sudo ln -s /opt/sublime_text_2/sublime_text /usr/local/bin/subl
  ```
  * Tell git to use sublime as default editor
    - Follow instructions here: https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/sublimeDefaultGitEditor.md

3. Install sublime package manager
  * Go to https://sublime.wbond.net/installation#st2
  * Copy the code for Sublime Text 2
  * Open sublime
  * In the toolbar click view -> view console
  * paste the code into the console
  * restart sublime

9. Install SublimeLinter
  * Open sublime and press ctrl+shift+p
  * In the window that opens start typing 'install', select "package control: Install package"
  * Then type 'SublimeLinter' and choose the one that ISN't the 'google closure one'
  * Configure SublimeLinter
    - Go to Prefrences -> Package Settings -> SublimeLinter -> Settings - User
    - "jshint_options" object and start adding configuration from http://www.jshint.com/docs/options/
    - Change "sublimelinter_delay" to 1
    - Change "sublimelinter_mark_style" to outline

11. Share the *Development* folder with the VM
  * Select Virtual Machine->Settings->Sharing from the VMWare menu
  * Turn sharing on (slider)
  * Click the + icon, browse to the *Development* folder and select it
  * Make a symlink from the /mnt/hgfs/ folder to the home directory

  ```bash
  ln -s /mnt/hgfs/Development/ ~/Development
  ```

12. Install MarkdownEditing Package
  * Follow instructions at https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installMarkdownEditing.md

* Copy markdown settings into documentation folder
    
    ```bash
    cp ~/.config/sublime-text-2/Packages/User/Markdown.sublime-settings /mnt/hgfs/Development/infrastructure/documentation/
    ```


14. Create GitHub repo for documentation
  * Create the 'documentation' repo on GitHub site with a readme.md
  * Connect the local documentation folder to the github repo
  
  ```bash
  cd ~/Development/Infrastructure/documentation
  # create a local git repo
  git init
  # establish the remote repo to connect to
  git remote add origin https://github.com/brandyn1bennett/documentation.git
  # merge with the remote repo
  git pull origin master
  # add the doc files and commit them
  git add -A && git commit -m 'added files'
  # push them to the remote repo
  git push
  ```
