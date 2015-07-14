Create /usr/local/bin
=====================

OSX doesn't always come with /usr/local/bin so you'll need to make it.  However, you'll have a bunch of problems with permissions if you don't do some stuff.

1. Make the directory

  ```bash
  sudo mkdir /usr/local/bin
  ```

2. Give yourself ownership
  
  ```bash
  sudo chown -R $(whoami) /usr/local/bin
  ```

3. If it doesn't have execute permissions, give it that too

  ```bash
  sudo chmod -R 755 /usr/local/bin
  ```
