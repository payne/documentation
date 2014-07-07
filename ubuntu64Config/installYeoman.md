Install Yeoman
==============

1. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/ubuntu64configBasics.md

2. Install Yeoman
  
  ```bash
  # Install yeoman globally with npm.  May take a while. Will throw some errors but it's fine
  npm install -g yo
  # Install webapp generator
  npm install -g generator-webapp
  ```

3. Run globalnode command incase anything is looking for the binaries in /usr/local/bin
  
  ```bash
  globalnode
  ```