Make a Custom ESLint Rule
=========================

1. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installYeoman.md

2. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installESLint.md

3. In some directory you want to work in clone the eslint repo

  ```bash
  git clone git://github.com/eslint/eslint.git
  ```

4. Open that file

  ```bash
  cd eslint
  ```

5. Install all the node_module dependencies

  ```bash
  npm install
  ```

6. Make sure nothing is broken
  
  ```bash
  npm test
  ```

7. Install the eslint yeoman generator
  ```bash
  npm install -g generator-eslint
  ```

8. Run globalnode just in case

  ```bash
  globalnode
  ```

9. Make a new rule with yeoman
  
  ```bash 
  yo eslint:rule
  ```
  * The generator will ask some questions
    - The rule id is the name of the rule.  Read the rule nameing conventions at http://eslint.org/docs/developer-guide/working-with-rules.html
  * This will make a source file, a test file, and a documentation file
    - The source file is in lib/rules
    - The documentation file is in docs/rules
    - The test file in tests/lib/rules

10. Make a new folder called 'ruletest'

  ```bash
  mkdir ruletest
  cd ruletest
  ```

11. In that folder put the following things
  * A test javascript file
  * A directory called rules that has your your new eslint rule in it
  * Add an <a href="https://github.com/brandyn1bennett/documentation/blob/master/eslint/.alloff-eslintrc" target="_blank">eslint file</a> that has everything turned off, except the rule you're working on so that you can test in isolation

12. When you want to see if your rule is working, run the following in your 'ruletest' directory:
  
  ```bash
  eslint --config .eslintrc --rulesdir rules test.js
  ```

13. If your using sublime text 3 with sublimelinter-eslint you can have the linter use your custom rule
  * Open up the user settings for SublimeLinter
    - Preferences -> Package Settings->Sublime Linter->Settings-user
  * In user.linters.eslint.args make it look like this
  
  ```javascript
  "linters": {
            "eslint": {
                "@disable": false,
                "args": [
                    "--rulesdir",
                    "/path/to/your/rules/directory/from/the/root"
                ],
  ```
  **Note**: You need to give the path to the rulesdir from the root, otherwise sublimelinter tries to add it to the path for the global eslint rules directory. Very dumb.  Doesn't even recognized 

14. Once the rule is behaving properly remove the rules directroy config option in sublimelinter and tell it to use the eslint .eslintrc file, so that we can make sure the code complies with standards

  ```js
  "linters": {
            "eslint": {
                "@disable": false,
                "args": [
                    "--config",
                    "/path/to/your/eslint/directory/eslint/.eslintrc"
                ],
  ```

15. Make your rule into a formal test following the guidelines <a href="http://eslint.org/docs/developer-guide/working-with-rules.html" target="_blank">here</a>
  * Change sublime linter to use the .eslintrc in the test directory, because tests have their own special formatting.  You may need to add the "no-trailing-whitespaces" rule, because the code won't meet the guidelines if it doesn't 
  
  ```js
  "linters": {
            "eslint": {
                "@disable": false,
                "args": [
                    "--config",
                    "/path/to/your/eslint/directory/eslint/tests/.eslintrc"
                ],
  ```

14. Run npm test to see if your rule works
  
  ```bash
  cd /path/to/your/eslint/directory/eslint
  npm test
  ```

15. Update the documentation in docs/rules to make sure it explains your rule properly

10. Make a test following the guidelines <a href="http://eslint.org/docs/developer-guide/working-with-rules.html" target="_blank">here</a>

11. Make your rule following the guidelines <a href="http://eslint.org/docs/developer-guide/working-with-rules.html" target="_blank">here</a>

12. Add your rules default confuration to conf/eslint.json

13. Add your rules documentation link to docs/rules/README.md
  * If your rule is off by default include (off by default) in the rule description

14. Run npm test to see if your rule works
  
  ```bash
  npm test
  ```

