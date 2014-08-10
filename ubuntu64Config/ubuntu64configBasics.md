Basic Ubuntu 64-bit config
==========================

1. Load up Ubuntu-64bit.iso in VMware with 2-cores and 4gb of ram

2. Remove ctrl-click shortcut
  * Go to Virtual Machine -> Settings -> Keyboard & Mouse -> Default Profile -> Mouse Shortcuts
  * Uncheck Secondary Button shortuct

3. Install OS updates

4. Change the resolution and change it back in display settings, so that the background-image fills up the whole screen

5. Go to "brightness & lock" in the settings menu and set the screen to turn off never

6. Take all the dumb stuff off of the launcher bar and add the terminal to the launcher

7. Install chrome
  * Open firefox and go to https://www.google.com/chrome/browser/
  * Click download
  * Select the 64-bit chrome for debian/ubuntu
  * install the package
  * Install Chrome Accessibility Developer Tools extension
    - Get it from https://chrome.google.com/webstore/detail/accessibility-developer-t/fpkknkljclfencbdbgkenhalefipecmb/related?hl=en

8. Install curl
  
  ```bash
  sudo apt-get install curl
  ```

9. Reinstall VMWare tools
  * In the VMWare menu (at the top), select Virtual Machine->Reinstall VMware tools
  * Extract the tar.gz file to the desktop

   ```bash
   cd ~/Desktop/vmware-tools-distrib
   sudo ./vmware-install.pl -d
   ```

  **Note:** The *-d* means to accept the defaults

10. Share the *Development* folder with the VM
  * Select Virtual Machine->Settings->Sharing from the VMWare menu
  * Turn sharing on (slider)
  * Click the + icon, browse to the *Development* folder and select it
  * Make a symlink from the /mnt/hgfs/ folder to the home directory

11. Install git
  * Install git and set global identity variables

   ```bash
   sudo apt-get install git
   git config --global user.email brandynlbennett@gmail.com
   git config --global user.name "Brandyn Bennett"
   ```

12. NVM
  * Clone nvm into ~/.nvm
   
     ```bash
     git clone https://github.com/creationix/nvm.git ~/.nvm
     ```
  * Source nvm in the ~/.bashrc so it opens, so the nvm shell script is loaded each time the terminal opens
  * Open ~/.bashrc with vi and add the following lines at the bottom of it
      
    ```bash
    # Source nvm
    . ~/.nvm/nvm.sh
    ```

    **Note:** Go to http://www.ccsf.edu/Pub/Fac/vi.html to learn how to use vi

  * Close and reopen the terminal or type:
  
    ```bash
    source ~/.bashrc
    ```

13. Install node
  * Go to https://nodejs.org and see what the most current version of node is
  * Install the most current nvmversion with nvm

    ```bash
    nvm install <current node version>
    ```
  * Set the default version so that the bash shell doesn't say "N/A version not installed" everytime you open it
    
    ```bash  
    nvm alias default <current node version>
    ```

14. Make a globalnode script
  * Make a new file called 'globalnode'

  ```bash
  sudo touch /usr/local/bin/globalnode
  ```
  * Add execute permission on the file
    
  ```bash
  sudo chmod 755 /usr/local/bin/globalnode
  ```
  * Open the file in vi

  ```bash
  sudo vi /usr/local/bin/globalnode
  ```
  * Copy and paste the contents from this file: https://github.com/brandyn1bennett/documentation/blob/master/bashScripts/globalnode into the globalnode script and save it
  * Run the command

  ```bash 
  globalnode
  ```


  
