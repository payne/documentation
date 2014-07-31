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

10. Make a test following the guidelines <a href="http://eslint.org/docs/developer-guide/working-with-rules.html" target="_blank">here</a>

11. Make your rule following the guidelines <a href="http://eslint.org/docs/developer-guide/working-with-rules.html" target="_blank">here</a>

12. Add your rules default confuration to conf/eslint.json

13. Add your rules documentation link to docs/rules/README.md
  * If your rule is off by default include (off by default) in the rule description

14. Run npm test to see if your rule works
  
  ```bash
  npm test
  ```
