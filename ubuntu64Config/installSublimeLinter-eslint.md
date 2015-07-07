Install SublimeLinter-eslint
============================

1. Do all the things here https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installSublimeLinter.md

2. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installESLint.md

3. Install Plugin
  * Open package manager ctrl + shift + p
  * Type 'install' and select 'package control: Install package'
  * type 'eslint' and select 'SublimeLinter-contrib-eslint'

4. Configure settings
  * Create a .eslintrc file in a project and put the settings from https://github.com/brandyn1bennett/documentation/blob/master/eslint/.eslintrc in it
  
  **Note:** When you make changes to .eslintrc you have to close and reopen sublime for sublimelinter to reload the changes.  Its a bit glitchy this way.  You didn't have to do that in sublime text 2

5. To change the the default linting file from conf/eslint.json
  * Put the .eslintrc file from https://github.com/brandyn1bennett/documentation/blob/master/eslint/.eslintrc in your home directory