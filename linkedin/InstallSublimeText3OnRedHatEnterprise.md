Install Sublime Text 3 On Red Hat Enterprise
============================================

1. Go to http://www.sublimetext.com/3 and select the 64-bit tarball for Linux
2. Extract the tarball
3. Move the tarball to the /opt/ folder

  ```bash
  cd Downloads
  sudo mv sublime_text_3 /opt/
  ```

4. Make a symlink to /usr/bin

  ```bash
  sudo ln -s /opt/
  sudo ln -s /opt/sublime_text_3/sublime_text /usr/bin/subl
  ```

5. Make a desktop icon
  * Change the `sublime_text.desktop` file to look like the one at https://github.com/brandyn1bennett/documentation/blob/master/linkedin/sublime_text.desktop
  
  **Note:** This changes the file paths to the proper "sublime_text_3" folder name and adds a proper Icon reference