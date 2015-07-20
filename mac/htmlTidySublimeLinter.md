HTML-Tidy Sublime Linter
========================

I would recommend using HtmlHint instead of this

1. Install tidy-html5 and make sure you have the `tidy5` command
2. Use Package Controll and search for `SublimeLinter-html-tidy`
3. Create a config file
  
  ```bash
  subl ~/html-tidy-config.txt
  ```

  * Tell Sublime to use your config file
    - Open the user settings for SublimeLinter
    - Change the args argument for html-tidy to be like this
    
    ```json
    "htmltidy": {
        "@disable": false,
        "args": ["-config ~/html-tidy-config.txt"],
        "excludes": []
    }
    ```

  * Add stuff to your config file
    - You can find the config options by running `tidy5 -help-config` in the command line
    - The `man` page lists descriptions about the various config options
    - There's also a more helpful quick reference here http://tecfa.unige.ch/guides/utils/tidy/quickref.html
