Install Node on Mac
===================

1. Install nvm
2. Go to https://nodejs.org and see what the most current version of node is
  * Install the most current version with nvm

    ```bash
    nvm install <current node version>
    ```
  * Set the default version so that the bash shell doesn't say "N/A version not installed" everytime you open it
    
    ```bash  
    nvm alias default <current node version>
    ```

3. Make a `globalnode` script
  * Nvm installs node into your user directory and makes it inaccessible to the whole system.  To make it available system wide and still keep the niceness of nvm you'll need to use a "globolnode" script
  * Make a new file called 'globalnode'

  ```bash
  sudo touch /usr/local/bin/globalnode
  ```
  * Add execute permission on the file
    
  ```bash
  sudo chmod 755 /usr/local/bin/globalnode
  ```
  * Open the file in vi or sublime (Make sure you run the editor as a super user)

  ```bash
  sudo vi /usr/local/bin/globalnode
  ```
  * Copy and paste the contents from this file: https://github.com/brandyn1bennett/documentation/blob/master/bashScripts/globalnode into the globalnode script and save it
  * Run the command

  ```bash 
  globalnode
  ```