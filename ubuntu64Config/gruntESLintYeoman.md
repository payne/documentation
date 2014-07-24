Configure Grunt
================

1. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installYeoman.md

2. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installESLint.md

3. Make a new app with Yeoman
  ```bash
    yo some-generator
  ```

4. In the root directory of the app add a copy of https://github.com/brandyn1bennett/documentation/blob/master/.eslintrc

5. Remove grunt-contrib-jshint and grunt-jshint-stylish

  ```bash
    npm uninstall jshint-stylish grunt-contrib-jshint --save-dev 
  ```

  * Delete the .jshintrc file

6. Add grunt-eslint

  ```bash
  npm install eslint-grunt --save-dev
  ```
  **Note:** There is another plugin called *grunt-eslint*, don't use this one.

7. Fix Gruntfile.js
  * Open Gruntfile.js
  * Load the eslint-grunt task after 'load-grunt-tasks'
    - We have to do this manually because the task 'load-grunt-tasks' only pulls in tasks with a 'grunt' prefix
    
    ```javascript
    require('load-grunt-tasks')(grunt);
    grunt.loadNpmTasks('eslint-grunt');
    ```
  
  * Remove jshint from the default task, so it looks like this
    - We're going to move the linting to the build and test tasks.
  
  ```javascript
  grunt.registerTask('default', [
    'test',
    'build'
  ]);
  ```

  * Add "eslint:test" to the top of the test task
    - We don't want builds to pass if it can't pass the lint test

  ```javascript
    grunt.registerTask('test', [
    'eslint:test',
    'clean:server',
    'concurrent:test',
    // ....
  ```

  * Add "eslint:all" to the top of build task

  ```javascript
  grunt.registerTask('build', [
    'eslint:all',
    'clean:dist',
    'wiredep',
    // ...
  ```

  *Remove JSHint from Gruntfile
    - Erase the jshint task
    - Replace any task references to jshint with "eslint"
  
  ```javascript
    'newer:jshint:all'
  ```
  Would now be
  ```javascript
    'newer:eslint:all'
  ```
  
9. Add an eslint task
  
  ```javascript
    'eslint': {
      'all': {
        'src': [ '<%= yeoman.app %>/scripts/{,*/}*.js' ],
        'options': {
          'config': '.eslintrc'
        }
      },
      'test': {
        'src': [ 'test/spec/{,*/}*.js' ],
        'options': {
          'config': '.eslintrc'
        }
      }
    },
  ```

10. Increase the amount of watch files possible
  * For some reason when you add eslint, it breaks the watch task even though there are the same amount of tasks.  The solution is to increase the number of tasks on the Linux operating system
  
  ```bash
  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  ```

  **Note:** This will add a new line to the /etc/sysctl.conf file that increases the number of possible watches to 524288 or 512k

11. 

