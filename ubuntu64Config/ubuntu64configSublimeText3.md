Installing Sublime Text 3 to Ubuntu 64 bit
==========================================

1. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/ubuntu64configBasics.md

2. Go to http://www.sublimetext.com/3 and download the Ubuntu 64 bit download
  * Click on the package in the downloads folder and install it
    **Note:** This will automatically add the 'subl' command to /usr/bin
  * Go to Preferences -> Settings-User and copy the Sublime configuration settings in from https://github.com/brandyn1bennett/documentation/blob/master/sublimeSettings/Preferences.sublime-settings

3. Install package manager
  * Go to https://sublime.wbond.net/installation and copy the code for sublime text 3
  * Open the sublime console by goint to view -> show console
  * Copy the code into the console and press enter
    **Note:** You don't need to restart sublime (you did for sublime text 2)
  * Hide the console (ctrl + `)

4. Install MarkdownEditing Package
  * Follow instructions at https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installMarkdownEditing.md

5. Install the BufferScroll package which remembers code foldings and scroll locations
  * Use ctrl+shift+p and type 'install'. Press Enter
  * Type "BufferScroll". Select the one that says "BufferScroll" and press Enter
