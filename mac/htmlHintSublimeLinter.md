Install HTMLHint Sublime Linter
===============================
**Note:** This won't lint templating languages like Handlebars or Dust :( Very stupid

1. Install htmlhint
2. Use package control and search for `SublimeLinter-contrib-htmlhint` and select it.
3. Create an .htmlhint file

  ```bash
  subl ~/.htmlhintrc
  ```
  * Put the stuff from my .htmlhintrc file in it
4. Configure SublimeLinter to use that file

  ```json
  "htmlhint": {
    "@disable": false,
    "args": [
        "--config",
        "~/.htmlhintrc"
    ],
    "excludes": []
  }
  ```

