1. Load up Ubuntu-64bit.iso in VMware with 2-cores and 4gb of ram

2. Install OS updates

3. Change the resolution and change it back in display settings, so that the background-image fills up the whole screen

4. Go to "brightness & lock" in the settings menu and set the screen to turn off never

5. Install chrome
  * Open firefox and go to https://www.google.com/chrome/browser/
  * Click download
  * Select the 64-bit chrome for debian/ubuntu
  * install the package
  * Install Chrome Accessibility Developer Tools extension
    - Get it from https://chrome.google.com/webstore/detail/accessibility-developer-t/fpkknkljclfencbdbgkenhalefipecmb/related?hl=en

6. Install sublime text 2
  * Add a new repo to apt-get, update it, and install it
   
  ```bash
  sudo add-apt-repository ppa:webupd8team/sublime-text-2
  sudo apt-get update
  sudo apt-get install sublime-text
  ```
  * Go to Preferences -> Settings-User and copy the desired Sublime configuration settings in.
    - Convert tabs to spaces
    - Each tab is 2 spaces
    - don't open files in new windows

7. Add subl command
  * Create a symlink from sublime text 2 to /usr/local/bin
    
  ```bash
  sudo ln -s /opt/sublime_text_2/sublime_text /usr/local/bin/subl
  ```

8. Install sublime package manager
  * Go to https://sublime.wbond.net/installation#st2
  * Copy the code for Sublime Text 2
  * Open sublime
  * In the toolbar click view -> view console
  * paste the code into the console
  * restart sublime

9. Install curl
  
  ```bash
  sudo apt-get install curl
  ```

10. Install git
  * Install git and set global identity variables
  * Have git use sublime for editing messages and such

  ```bash
  sudo apt-get install git
  git config --global user.email brandynlbennett@gmail.com
  git config --global user.name "Brandyn Bennett"
  git config --global core.editor subl --wait
  ```

11. NVM
  * Clone nvm into ~/.nvm
   
    ```bash
    git clone https://github.com/creationix/nvm.git ~/.nvm
    ```
  * Source nvm in the ~/.bashrc so it opens, so the nvm shell script is loaded each time the terminal opens
  * Open ~/.bashrc and add the following lines at the bottom of it
      
    ```bash
    # Source nvm
    . ~/.nvm/nvm.sh
    ```
  * Close and reopen the terminal or type:
  
    ```bash
    source ~/.bashrc
    ```

12. Install node
  * Go to nodejs.org and see what the most current version of node is
  * Install the most current nvmversion with nvm
  
    ```bash
    nvm install <current node version>
    ```
  * Set the default version so that the bash shell doesn't say "N/A version not installed" everytime you open it
    
    ```bash  
    nvm alias default <current node version>
    ```

13. Make a globalnode script
  * Open a text editor via sudo
  * Make a script with the following command, so that the current version of node set by NVM can be found by other programs

    ```bash
    #! /bin/bash
    n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
    ```
  * Save this file in /usr/local/bin with the name 'globalnode' (no file extension)
  * Add execute permission on the file
    
    ```bash
    chmod 755 /usr/local/bin/globalnode
    ```

14. Install SublimeLinter
  * Open sublime and press ctrl+shift+p
  * In the window that opens start typing 'install', select "package control: Install package"
  * Then type 'SublimeLinter' and choose the one that ISN't the 'google closure one'
  * Configure SublimeLinter
    - Go to Prefrences -> Package Settings -> SublimeLinter -> Settings - User
    - "jshint_options" object and start adding configuration from http://www.jshint.com/docs/options/
    - Change "sublimelinter_delay" to 1
    - Change "sublimelinter_mark_style" to outline

15. Reinstall VMWare tools
  * In the VMWare menu (at the top), select Virtual Machine->Reinstall VMware tools
  * Extract the tar.gz file to the desktop

  ```bash
  cd Desktop/vmware-tools-distrib
  sudo ./vmware-install.pl -d
  ```

  **Note:** The *-d* means to accept the defaults

16. Share the *Development* folder with the VM
  * Select Virtual Machine->Settings->Sharing from the VMWare menu
  * Turn sharing on (slider)
  * Click the + icon, browse to the *Development* folder and select it
  * Make a symlink from the /mnt/hgfs/ folder to the home directory

  ```bash
  ln -s /mnt/hgfs/Development/ ~/Development
  ```

17. Add MarkdownEditing Plugin to sublime
  * Do ctrl+shift+p -> type 'install' -> type 'MarkdownEditing' and select the first one
  * Open up a file with extension '.md'
  * Make all '.md' files use the MarkdownEditing configurations 
    - Select the language selector -> 'Open all with current extension as..' -> MarkdownEditing -> MarkdownGFM
  * Make '.md' files use a different color scheme than other languages
    - Select Preferences-> Settings-More -> Syntax Specific-User
    - Add this to the file
  
    ```json
    "color_scheme": "Packages/MarkdownEditing/MarkdownEditor.tmTheme",
    "line_numbers": true,
    "draw_centered": false,
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    "wrap_width": 200
    ```
    * Copy markdown settings into documentation folder
    
    ```bash
    cp ~/.config/sublime-text-2/Packages/User/Markdown.sublime-settings /mnt/hgfs/Development/infrastructure/documentation/
    ```

18. Copy sublime settings into documentation folder
  
  ```bash
  cp /home/brandyn/.config/sublime-text-2/Packages/User/SublimeLinter.sublime-settings /mnt/hgfs/Development/infrastructure/documentation/
  ```

19. Create GitHub repo for documentation
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

20. Install Yeoman
  
  ```bash
  # Install yeoman globally with npm.  May take a while. Will throw some errors but it's fine
  npm install -g yo
  # Install webapp generator
  npm install -g generator-webapp
  ```

21. Install Yeoman Ember-Generator

  ```bash
  

