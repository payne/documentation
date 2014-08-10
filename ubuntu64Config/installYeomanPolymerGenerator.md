Install Yeoman Polymer Generator
===============================

1. Do all the stuff in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installYeoman.md

2. Install Polymer Generator

  ```bash
  npm install -g generator-polymer
  ```

3. Run globalnode script just in case other programs need it to be in usr/local/bin

  ```bash
  globalnode
  ```

4. Create a new polymer app by making a new directory

  ```bash
  mkdir newProject && cd newProject
  yo polymer
  ```
