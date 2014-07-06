Basic Ubuntu 64-bit config
==========================

1. Load up Ubuntu-64bit.iso in VMware with 2-cores and 4gb of ram

2. Install OS updates

3. Change the resolution and change it back in display settings, so that the background-image fills up the whole screen

4. Go to "brightness & lock" in the settings menu and set the screen to turn off never

5. Take all the dumb stuff off of the launcher bar and add the terminal to the launcher

6. Install chrome
  * Open firefox and go to https://www.google.com/chrome/browser/
  * Click download
  * Select the 64-bit chrome for debian/ubuntu
  * install the package
  * Install Chrome Accessibility Developer Tools extension
    - Get it from https://chrome.google.com/webstore/detail/accessibility-developer-t/fpkknkljclfencbdbgkenhalefipecmb/related?hl=en

7. Install curl
  
  ```bash
  sudo apt-get install curl
  ```

8. Install git
  * Install git and set global identity variables

  ```bash
  sudo apt-get install git
  git config --global user.email brandynlbennett@gmail.com
  git config --global user.name "Brandyn Bennett"
  ```