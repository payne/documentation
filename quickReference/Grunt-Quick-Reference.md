![Grunt Logo](http://taupecat.com/wp-content/uploads/2014/01/grunt.png)
Grunt Quick Reference
========================================================================================

* [References](#references)
* [Install](#install)
* [Tasks](#tasks)
* [Variables](#variables)
* [HTML](#html)
* [Nesting](#nesting)
* [Extending](#extending)
* [Mixins](#mixins)
* [Color](#color)
* [Clearfix](#clearfix)
* [Grids With Susy](#grids-with-susy)
* [Media Queries](#media-queries)
* [CSS3 Mixins](#css3-mixins)
* [Images](#images)
* [Text Replacement](#text-replacement)
* [SVG's](#svgs)
* [CSS Transform](#css-transform)
* [CSS Filters](#css-filters)
* [Math Calculations](#math-calculations)
* [Control Directives](#control-directives)
* [Stripping and Adding Units](#stripping-and-adding-units)
* [Functions](#functions)
* [Statistics](#statistics)
* [Clear Cache](#clear-cache)
* [Chrome Tools](#chrome-tools)

References
-------------------------------------------------------------------------------------------
*Automate with Grunt: The Build Tool for JavaScript* - Brian Hogan

Install
-------------------------------------------------------------------------------------------
Install the Grunt CLI: 
```bash
npm install -g grunt-cli
```

Create a new directory for your project.

Add a `package.json` file: `npm init` and input the specifics for your project.

Add Grunt as a developer dependency:
```bash
npm install grunt --save-dev
```

Add a *Gruntfile.js* to your project root.

Add the boillerplate Node module code into the Gruntfile: 
```javascript
module.exports = function(grunt){};
```

Tasks
----------------------------------------------------------------------------------------
The default task is the task that gets run when the grunt command is executed.

Create a new task:
```javascript
grunt.registerTask('name', 'description', function(arg1, arg2){});
```
Run the task by typing `grunt taskname` in the terminal.

If you type `grunt --help` in the terminal it will show available tasks and their descriptions.

Pass parameters to grunt tasks like this:
```javascript
grunt taskname:arg1:arg2
```
Use `grunt.log.writeln();` instead of `console.log();` 

### Errors
```javascript
grunt.warn('message');
```
Stops the tasks and delivers a message, but can be forced to continue the 
task with `--force`

```javascript
grunt.fatal('message'); 
```
Disallows `--force`

### Chaining Tasks
Pass a task an array of tasks:
```javascript
grunt.registerTask('all', ['default', 'greet:Brian', 'addNumbers:2:3']);
```

Managing Files
----------------------------------------------------------------------------------------
Delete the destination folder and its contents each time you re-create it.

Use the grunt utilities, because they work accross operating systems.

Create a file: `grunt.file.mkdir('filePath');`

Delete a file: `grunt.file.delete('filePath');` 

It will delete a file, or a folder, and all its contents.

Read the contents of a file: `grunt.file.read('filePath');`

Write a file: `grunt.file.write('dir/file.txt', fileContent);`

Copy a file: grunt.file.copy('filePath','destPath'); 
    
It won't copy an entire folder and its content.

Check if it's a directory: `grunt.file.isDir('filePath');`

Recurse through a directory: `grunt.file.recurse('filePath',function(absPath){})`

Pull in the data from a JSON file: `grunt.file.readJSON('package.json');`

Check that a file exists: `grunt.file.exists('filePath');`

Configuration
----------------------------------------------------------------------------------------
Create the configuration object like this:
```javascript
grunt.config.init({
  taskName: {
    target1:{},
    target2:{},
    options: {}
  } 
});
```
You can also use `grunt.initConfig({});`

Add config options in modular peices: `grunt.config('taskName', {});`

A target is a config group for a task.

It's a best practice to put all the options for a task in an `options` property.

You can make a task dependent on a configuration property with: `grunt.config.requires('config property');`

You can also use the more dynamic: `this.requiresConfig(this.name+'.config.property');` 

Pull a value from the config with: `grunt.config.get('config.property');`

You can access the config options for the task you are in with `this.options();`

Templating
----------------------------------------------------------------------------------------
Use the templating syntax like this:
```javascript
var content = '<%=pkg.name %>';
```
Process the template like this:
```javascript
content = grunt.template.process(content);
```
If you are using the template syntax in a configuration object, you don't have to manually process it.

Grunt has some special methods designed for templates like: `grunt.template.date`

Multitasks
----------------------------------------------------------------------------------------
Create a multitask:
```javascript
grunt.registerMultiTask('taskName', 'desc', function(){});
```
Multitask names need to match the corresponding configuration section. 

When the task is run Grunt will automatically look up the task name in the config.

Unless you specify a specific target to execute like this: `grunt task:target` then the multitask will be run against all the targets in the corresponding `config` object.

You access the current target with: `this.target;`

You can access the data inside the target with: `this.data;`

You can access all the files specified in the current target as an array with: `this.files;`

Files, that don't exist may be included in the array, so you have to check for them.

Access the `src` array of a target with: `this.files[i].src;`

Access the destination of a target with: `this.files[i].dest;`

There are multiple ways to configure the `src` and `dest` files, and as long as one of the conventions is followed the `multiTask` will be able to access the properties.

Async
----------------------------------------------------------------------------------------
You can make a task asynchronous with the async function:
```javascript
var done = this.async();
// do some async code
done(); // tells Grunt the task is done.
```

Plugins
----------------------------------------------------------------------------------------
Load a plugin from NPM (make sure you do this, before adding config options): 
```javascript
grunt.loadNpmTasks('plugin-name');
```

####Structure
A folder that is the plugin name, separated by hyphens. 

A tasks folder with files that define the tasks. 

Inside tasks, is a _lib_ folder that holds the functions/objects that do the actual work.

In the root there is also a Gruntfile.js that loads the task and a package.json. Use npm to add grunt to the project.

Workflow
----------------------------------------------------------------------------------------
Compile, Concat, Minify

Project Scaffolds
----------------------------------------------------------------------------------------
Use the `grunt-init` CLI tool. 

Install it globally:
```javascript
npm install -g grunt-init
```

The templates get stored in your home folder at: `~/.grunt-init/.`

You can use git to `clone grunt-init` plugins into that folder, and they will be accessible by the CLI tool.

### Custom Templates
#### Structure
There's a *template.js* file and a root folder that contains the files that will make up the project. 

The name of the template should be the name of the base folder.

#### template.js:
Add a description: `exports.description = 'desc';`

The description is shown when you type `grunt-init` without any arguments. 

This command shows all the installed templates and their descriptions.

Add a note: `exports.notes = 'notes';`

The notes get displayed when you run the template.

Create the template:
```javascript
exports.template=function(grunt,init,done){
    init.process({}, [
      // prompts go here
      ], function(err, props) {
      // actual work goes here
  }); 
};
```

#### Prompts
Basic prompt with default value:
```javascript
init.prompt('name', 'AwesomeCo'), Custom prompt:
{
  name: 'gruntfile',
  messsage: 'do you want a gruntfile?',
  default: 'Y/n',
  warning: 'You should really use one'
},
```

#### root folder
Put the HTML, CSS, JavaScript and any other types of files you want added to the project in this folder.

Always put every file possible in the root folder then filter them out later.

You can insert data from the CLI prompts with tempalting syntax:
```
<title>{%= name %}</title>
```

You can conditionally add or remove things in the template:
```
{% if (borderbox) {%}
-webkit-box-sizing: border-box
{% } %}
```

#### Process the template
You do all the processing work in the callback function of `init.process`

Get an array of files from the root folder and its children:
```javascript
var files = init.filesToCopy(props);
```

Get a boolean value from a y/n prompt:
```javascript
props.gruntfile=y/i.test(props.gruntfile);
```

If the user doesn't want a file, delete it from the files array. Copy all the root files and process the templates: 
```javascript
init.copyAndProcess(files, props);
```

Write a package.json with the prompt data: 
```javascript
init.writePackageJSON('package.json', props);
```

#### rename.json
You can map files in the root directory to different destination destinations, and change the names of files with template strings.


