Install NVM
===========

1. Clone nvm into ~/.nvm
   
  ```bash
   curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
  ```
  **Note:** You may have to accept the Xcode license agreement if you haven't installed xcode already.
  **Note:** Don't sudo, otherwise the folder permissions may be added to the root user

2. Source nvm in the ~/.bash_profile so it opens, so the nvm shell script is loaded each time the terminal opens
  * Open ~/.bash_profile_ with a text editor and add these lines to it.
      
  ```bash
  # Source nvm
  . ~/.nvm/nvm.sh
  ```

  * Close and reopen the terminal or type:
    ```bash
    source ~/.bash_profile
    ```