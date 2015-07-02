Install Sublime Text 3 On Red Hat Enterprise
============================================

1. Go to http://www.sublimetext.com/3 and select the 64-bit tarball for Linux
2. Extract the tarball
3. Move the tarball to the /opt/ folder

  '''bash
  cd Downloads
  sudo mv sublime_text_3 /opt/
  '''

4. Make a symlink to /usr/bin

  '''bash
  sudo ln -s /opt/
  sudo ln -s /opt/sublime_text_3/sublime_text /usr/bin/subl
  '''

5. Make a desktop icon
  * 