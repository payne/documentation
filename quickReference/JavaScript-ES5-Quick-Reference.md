JavaScript ES5 Quick Reference
========================================================================================

* [References](#references)

References
-------------------------------------------------------------------------------------------
*JavaScript the Good Parts* - Douglas Crockford
*Maintainable JavaScript* - Nicholas C. Zakas
*JavaScript Patterns* - Stoyan Stefanov

Variables
-------------------------------------------------------------------------------------------
JavaScript blocks ( `if`, `for`, `switch`... ) don’t create a new scope, so variables should be defined at the top of functions

Functions
-------------------------------------------------------------------------------------------
`return` value will be `undefined` if not specified

Any `function` executed with `new` in front of it will turn the function
into a `constructor` function, which will `return` an object

If `return` is used in a `constructor` function, the value must be
an object. If no `return` is provided the function will automatically create and return a new object that is bound to `this`

### Invocation Patterns
Method invocation pattern: `this` is bound to the object the function is a property of

Function invocation pattern: `this` is bound to the global object if the function isn’t a property of an object

Constructor invocation pattern: `this` is bound to the new object that is created and returned by the constructor function

Apply invocation pattern: `this` is bound to whatever we tell it

### Types
Named function expression:
```javascript
var add = function add(){};
```

Unnamed function expression/anonymous function:
```javascript
var add = function (){}; Function declaration:
function add(){}
```

Semicolon is required for function expressions.

Just use function expressions all the time

### Closure
An inner function has access to references of the parameters and variables of the function its nested within, not copies

Avoid creating functions in a loop

JSON
-------------------------------------------------------------------------------------------
All JSON keys and strings must be in double quotes

Make sure to parse the JSON and escape any special characters before adding it to the DOM, so that evil script tags aren’t added to the page

If running ES3 you can download the JSON.org library

Truthy/Falsy
-------------------------------------------------------------------------------------------
Falsy values: `false`, `null`, `undefined`, `''`, `0`, `NaN`

Comparisons
-------------------------------------------------------------------------------------------
`NaN` can only be compared by doing 
```javascript
isNaN(number);
```

It doesn’t equal anything, not even itself

`typeof null` will return `'object'` so always do `value === null` instead

`isFinite()` will reject both `NaN` and `Infinity`

`typeof array` will return `'object'`. So you have to do the following: 
```javascript
Object.prototype.toString.apply(value) === '[object Array]';
```

Objects will only be equal if they are the same object

`typeof` returns a string `‘undefined’`` for both uninitialized and undeclared variables. 

Uninitialized variables are given a value of undefined. Initialize variables that will later hold values to `null` to avoid confusion.

Use `in` to check the existence of a property in an object. If you want to check an instance property use `hasOwnProperty()`

To force a `falsy` value to return a real `boolean` you can use double negation
```javascript
var linux = !!process.platform.match(/^linux/);
```

Or if you want to be more clear
```javascript
var linux = Boolean(process.platform.match(/^linux/));
```

Control Flow
-------------------------------------------------------------------------------------------
### `for in`
Need to use `obj.hasOwnProperty(key)` otherwise members in the prototype chain will be included

There is no guarantee on the order that `for in` uses

JavaScript does not provide tail recursion optimization

### `for`
Cache the `length` of an array that's being looped over, otherwise JavaScript will look up the `length` everytime. Not effecient

Objects
-------------------------------------------------------------------------------------------
Everything is an object. Collection of name/value pairs

Property values can be anything exept `undefined`

Objects are passed by reference, they are never copied

`delete` will remove a property in an object, but not from its `prototype`

Don’t modify objects you don’t own

### Prototype
Every object is linked to a `prototype` object that it inherits properties from

If a value isn’t found in an object, then JavaScript automatically looks for it in its `prototype`, all the way up to `Object.prototype`. If it isn’t found anywhere in the `prototype` chain, then `undefined` is returned

If a new property is added to a prototype, then all objects that are linked to that prototype will immediately inherit that property

Any members that will be shared among objects should be attached to the prototype, otherwise they will be recreated each time new is called

The prototype property should point to an object, not a function

Arrays
-------------------------------------------------------------------------------------------
JavaScript doesn’t have real arrays, just objects with array-like properties

The `length` property is the largest integer property in the array plus one. Not necessarily the number of properties in the array

Making the `length` property smaller will cause properties with a higher subscript to be deleted

It is better NOT to use `for in`, because the order is not guaranteed

### Methods
`concat(items...)` makes a shallow copy of the array with items appended to it
```javascript
var arr = [1, 2];
arr.concat(3, 4); // [1, 2, 3, 4]
```

`join(separator)` makes a string from an array, with a given separator
```javscript
var arr = [’a’, ‘b’, ‘c’];
arr.join(’’); // ‘abc’
```

`push/pop` adds/removes from the end of the array 

`unshift/shift` adds/removes from the beginning of the array.  `unshift` is slower than `pop`

`slice(start, end)` makes a shallow copy of a portion of an array and takes a `start` and optional `end` parameter. If either parameter is `-` the `length` will automatically be added to it
```javascript
var arr = [’a’, ‘b’, ‘c’];
arr.slice(1, 2); // [’b’]
```

`splice(start, numDelete)` deletes properties in the array. The first argument is the index to start at, the second arguments is how many properties to delete. Additional arguments will be inserted at the starting point. It returns an array of deleted members.
```javascript
var arr = [’a’, ‘b’, ‘c’];
arr.splice(1, 1, ‘z’); // [’a’, ‘z’, ‘c’];
```

`sort(function(a, b) {})` only works on strings. You can pass it your own sorting function w/ two params that should return `0` if the params are equal, a `negative number` if the first param should be first and a `postitve number` if the second param should come first

Numbers
-------------------------------------------------------------------------------------------
No separate integer type 
```javascript
1 === 1.0
```

Exponents: multiply the part before the `e` by `10` then raise to the part after the `e`: 
```javascript
100 === 1e2
```

`NaN` is a number that is the result of an operation that can’t perform a normal result

### Methods
`toFixed(numDigits)` turns the number into a string in decimal form with an optional number of digits (i.e. length after the decimal) between 0 and 20

`toPrecision(precision)` turns the number into a string in decimal form. The optional parameter controls the digits of precision (i.e. the total length) and should be between `1` and `21`

`toString(radix)` turns the number into a string. The radix is which number base to use (e.g. 2, 8, 10, 16). The default is `10`.

RegEx
-------------------------------------------------------------------------------------------
Must be on a single line

Best to initialize with a literal instead of `RegExp()` so that you don’t have to *double the backslashes*. The literals are passed around by reference not value
```javascript
var my_regexp = /"(?:\\.|[ ^\\\"])*"/g;
```

### Flags
Flags can be appended to the last / that do certain things. 

`g` - matches multiple times. 

`i` - makes the match case insensitive. 

`m` - will multiline match so `^` and `$` can match line-ending characters

### Methods
These methods usually perform better than their string counterparts

#### `exec(string)` 
returns an `array` with `[0]` being the substring found, `[1]` being the text from capture group 1, `[2]` being the text from capture group 2, etc... 

If the match fails it returns `null`. 

Using the `g` flag lets you call exec in a loop, but makes you reset `regexp.lastIndex` to 0 yourself if you exit the loop early.

`test(string)` returns `true`/`false` based on whether there was a match.

Strings
-------------------------------------------------------------------------------------------
You can insert character codes like this 
```javascript
var A = "\u0041" 
```

Strings have a `length` property that represents the number of characters in the string

### Methods
`charAt(pos)` returns the charater at the position given. If `pos` is less than `0` or greater than `string.length` an empty string will be returned

`charCodeAt(pos)` returns the character code at the position. `NaN` will be returned if `pos` is less than `0` or greater than `string.length`

`indexOf(searchString, pos)` finds the first position of the first matched character of the substring. You can change where the search starts by providing the `pos` character. Will return `-1` if nothing is found.

`lastIndexOf(searchString, pos)` like `indexOf` but it starts at the end.

`match(regexp)` Will be just like `regexp.exec()` except that if you use a `g` flag it will make an array of all matches that excludes capturing groups

#### `replace(searchValue, replaceValue)` 
Produces a new string. If the `searchValue` is a `regexp` with a `g` flag than it will replace all occurrences otherwise it will replaces just the first occurence

If `replaceValue` is a string, the `$` has special meaning: 
* `$$` - replaces `$`
* `$&` - replaces matched text
* `$number` - replaces the capture group
* `` $` ``  - replaces the preceding match text, 
* `$’` - replaces the after match text. 
```javscript
'(555)666-1212'.replace(/\((\d{3})\)/g, '$1-'); // ‘555-666-1212’
```

If replaceValue is a function it will be called by each match. The string returned by the function will be used as replacement text. The 1st param is the matched text, the 2nd param is capture group 1, the 3rd is capture group 2, etc...
search(regexp) is indexOf but takes a regexp.
slice(start,end) makes a new string by copying a portion of another string. end is optional and both start and end can be negative and have string.length added to them
split(separator, limit) creates an array by splitting the array on the separator. limit will limit the number of splits. separator can be a regexp. If it’s a regexp, than capturing groups get included in the split. Some implementations will automatically supress empty strings from the output if the separator is a regexp
toLocaleLowerCase/toLocaleUpperCase makes a new string in lower/upper case that follows the rules of the local language.

Exceptions
You can throw your own exception object, but you may miss out on information like line number and filename.
throw { name: 'TypeError', message: 'add needs numbers' };
An exception object can have more properties added to it

To make sure you get all the browser’s contextual information use throw new Error(’some message’);

To know which errors are yours create a custom error type
function MyError( message ) {
  this.message = message;
}
MyError.prototype = new Error();
if (ex instanceof MyError)
Always include function name and the reason for the error
Only throw errors in parts of the code that are likely to fail in a particular way. Mimicking statically typed languages is overkill
If you can’t identify all the places where a function will be called ahead of time, then you need some error checking

Patterns
Namespace
Use a single global object for your application. The name is often done in all caps
Declaring Dependencies
Create a local variable at the top of your module for each dependency your module relies on
Immediate Invoking Function Expression (IIFE)
Keeps stuff out of the global scope.
You can pass in parameters to it. Especially for dependencies and the global object.
Can use it in object literals, to create a computed property. However, it doesn’t work with this.
If using as a module, it won’t automatically return and this will be the global object. You have to specify what to return
(function () {
  alert('watch out!');
}());
Immediate Object Initialization
Good for one-off initialization tasks, but may not minify well
({
max_width: 600,
gimmeMax: function () {
}, return this.max_width + "x" + 400;
  init: function (){
    console.log(this.gimmeMax());
  }
}).init();

Callback
Passing a function as a parameter
If the callback relies on this you may have to pass in the object you want the function called on, or this won’t be correct

Self-defining Function
Helpful if the function needs some prep work that only happens once
Drawbacks: new properties that get added will be lost. If given a new variable name the redefinition won’t happen
var scareMe = function () {
  alert("Boo!");
  scareMe = function () {
    alert(”Double boo!");
  };
};
Chaining
Have methods return this if they have no other meaningful value to return.
obj.increment().add(3).shout();
Can make things harder to debug, if it’s all on one line

Currying
A function that returns another function
function add(x, y) {
  if (typeof y === "undefined") {
// partial
    return function (y) {
    };return x + y;
}
  // full application
} return x + y;
add(3)(4);

Memoization
Caching the results of a function
var myFunc = function (param) {
  if (!myFunc.cache[param]) {
    var result = {};
    // ... expensive operation ...
  } myFunc.cache[param] = result;
  return myFunc.cache[param];
};
// cache storage
myFunc.cache = {};
Configuration Objects

Have an object be a parameter of a function so that it’s more flexible

Module
myModule = (function () {
  // dependencies
  // private properties
  // private methods
// public API
  return {
    func1: function () {},
  };func2: function () {}
}());

Revealing Module
myModule = (function () {
  // dependencies
  // private properties
  // private methods
  func1 = function () {};
  func2 = function () {};
  // public API
  return {
    func1: func1,
  };func2: func2
}());
Keeps private functions working, even if someone messes with public API

Privacy
Private members: Wrap data you want private in a function and make sure it’s local. Don’t pass references to objects and arrays you want to keep private. POLA
Privileged methods: Functions that can access private members
Static Public: add a property to a constructor function
var Gadget = function () {};
Gadget.isShiny = function() { return "you
bet"; };
Static Private: return a function from the constructor that accesses the private member.
var Gadget = (function () {
  var counter = 0;
  return function() {
  };console.log(counter += 1);
}());
Init-time Branching
Good for feature detection. Sniff features separately and do the sniffing only once
var utils = { addListener: null };
if (window.addEventListener) {
  utils.addListener =function(el, type, fn){
  };el.addEventListener(type, fn, false);
} else if (document.attachEvent) { // IE
  utils.addListener =function(el, type, fn){
  };el.attachEvent('on' + type, fn);
}
Sandbox
Fixes drawbacks of namespacing pattern. One global Sandbox() constructor that creates an isolated environment for all code. See “JavaScript Patterns” by Stoyan Stefanov for implementation specifics
Mix-in
Loop through all source objects and add their properties to a new child object
Borrowing Methods
Use call() or apply().
If the borrowed method depends on this and you want to assign the borrowed method in advance or use it as callback it’s best to bind it.
function bind(o, m) {
  return function() {
return m.apply(o, [].slice.call(arguments));
}; }

SIngleton
Object literals are already singletons.
If you are using a constructor function, you can make it return the same object instead of new object each time. Doing this, isn’t very practical. You can do it with a static property or a closure. function Universe() {
  var instance = this;
  Universe = function () { return instance; };
}
Factory
Intended to create objects and perform repeating operations when setting up similar objects.
CarMaker.factory = function (type) {
  newcar = new CarMaker[type]();
  return newcar;
};
CarMaker.Compact = function () {this.doors=4;};
var corolla = CarMaker.factory('Compact');
Iterator
An object that has some aggregate data that can be iterated over with a next() method.
Decorator
Dynamically add functionality to an object at run-time
function Sale(price) {
  this.price = price || 100;
} this.decorators_list = [];
Sale.decorators = {};
Sale.decorators.fedtax = {
  getPrice: function (price) {
  } return price + price * 5 / 100;
};
Sale.prototype.decorate = function (decorator) {
};this.decorators_list.push(decorator);
Sale.prototype.getPrice = function () {
  var price = this.price, i,
    max = this.decorators_list.length, name;
  for (i = 0; i < max; i += 1) {
    name = this.decorators_list[i];
    price = Sale.decorators[
name].getPrice(price);
}
  return price;
};
var sale = new Sale(100);
sale.decorate('fedtax');
Strategy
Pick different algorithms at runtime. Good for form validation. See “JavaScript Patterns” by Stoyan Stefanov for implementation specifics

Facade
Provides an alternative interface to an object. Good for hiding browser differences or wrapping methods that are commonly called together.
Proxy
One object acts as an interface to another object. A proxy sits between two objects and protects access. Good for lazy initialization, handling network requests, or other expensive operations. The proxy can also be useful as a cache.
Mediator
Several indepenent objects communicate to each other through a mediator object, which knows about all the other objects.
Observer
Instead of calling another object’s method, the object subscribes to the other object’s activities and gets notifications. Also known as subscriber/publisher.
Browser Patterns
Separation of Concerns
Keep HTML, CSS, and JavaScript separate as possible. JavaScript should be able to function independently of CSS
Progressive Enhancement: Make it useful with just HTML, then add functionality based on what the browser supports
DOM Scripting
Access the DOM as little as possible.
Don’t access the DOM in loops, assign DOM references to local variables, use selector APIs, cache the length property
Manipulate the DOM as little as possible. Causes repaints and reflows which are expensive.
Use document fragments to make a batch update outside the live DOM tree, then update the DOM all at once

Events
Don’t attach events directly to DOM elements, instead use addEventListener()

If multiple DOM elements will use the same handler and are
wrapped in a common parent element, you can attach one handler to the parent element and then filter out events that aren’t interesting.
Don’t put application logic in the event handler.
Don’t put the event object around. Only pass functions what they need to function

Long-running Scripts
Use setTimeout() with a delay of 0, to imitate threads, so the task is completed as soon as possible without freezing up the UI.
Remote Scripts
JSONP is not restricted by same-domain policy. It’s JSON wrapped in a function call that is provided with the request. The provided function will specifiy which function handles the response

Inheritance
“Prefer object composition to class inheritance” - GoF

Always strive for picking a “modern” pattern, one that doesn’t require you to think about classes
Objects inherit properties directly from other objects
Classical Pattern #1 - The Default Pattern
function inherit(C, P) {
} C.prototype = new P();
A drawback of this pattern is that you inherit both “own” properties and prototype properties
Classical Pattern #2 - Rent-a-Constructor
Children objects get copies of inherited members, unlike #1 where they only get references
Solves the problem of passing arguments from child to parent
Child can’t overwrite a parent’s property
function Child(name) {
  Parent.apply(this, arguments);
}
A drawback is that nothing from the prototype gets inherited
Classical Pattern #3 - Rent and Set Prototype
Objects get copies of the parent’s members and references to the reusable prototype functionality
function Child(name) {
} Parent.apply(this, arguments);
Child.prototype = new Parent();
Classical Pattern #4 - Share the Prototype
function inherit(C, P) {
  C.prototype = P.prototype;
}
A drawback is that if any child object modifies the prototype, all the parents and grandparents will be affected
Classical Pattern #5 - Temporary Constructor
function inherit(C, P) {
  var F = function () {};
  F.prototype = P.prototype;
  C.prototype = new F();
  C.uber = P.prototype;
  C.prototype.constructor = C;
}
Child only inherits from prototype. Superclass is stored
“Prefer object composition to class inheritance” - GoF
with uber in case it’s needed. The constructor is reset for runtime object introspection.
Can optimize this by storing the proxy function in a closure in an IIFE that returns a function

Prototypal Inheritance
function object(o) {
  function F() {}
  F.prototype = o;
} return new F();
var parent = { name: "Papa" };
var child = object(parent);
If you want to inherit just the prototype you can do this:
var kid = object(Person.prototype);
Inheritance by Copying Properties
You can implement an extend() or extendDeep() function to make shallow or deep copies of all the objects properties and make them part of a new object

ES5
Inheritance
Prototypal inheritance is part of the language
var child = Object.create(parent);
You can pass Object.create() an optional object parameter.
The properties of the object parameter will added as “own” properties of the new child object
var child = Object.create(parent, {age: 2});
Type checking
You can use the Array.isArray() function to check if something is an array.
JSON
Can use JSON.parse() to check JSON for problems
Can use JSON.stringify() to turn an object into valid JSON
Strict Mode
Put “use strict”; at the beginning of a function to enforce using a subset of the language that will help prevent “bad” parts from getting used.
RegEx
Using a regex literal will also create new objects
Borrowing Methods
Built-in bind function:
var newFunc = someFunc.bind(myObj, arg1, arg2); Long-running Scripts
Modern browsers have Web Workers which can perform expensive operations in the background.
Preventing Modification
preventExtension(): no new properties or methods can be added, but existing ones can be modified or deleted.
seal(): same as preventExtension, but existing properties and methods can’t be deleted.
freeze(): Same as seal, plus prevents existing properties and methods from being modified

Code Style
Make a program structure that anticipates, but is not overly burdened by possible modifications
Throw away the “first-draft” and don’t copy and paste from it in the “second-draft”
Variables
At the top of every function declare all the necessary variables in a comma separated list, with a single var statement.
Comments
// Use this style everywhere except for JSDoc
Obsolete comments are worse than no comments. Don’t comment when something is apparent from the code itself.
Comment on things that might be percieved as errors and browser-specific hacks
Use a documentation generator
Indentation
Don’t use tabs. Use spaces. Pick 2 or 4 spaces, and stick to it.

Line-Length
Use 80 or 100 characters

Line-Breaking
Always end a line with an operator, so the browser doesn’t automatically insert a semi-colon.
After a line-break indent two levels, unless it’s a variable declaration, then it should align with the first part of the assignment
Blank Lines
Add them between methods, between local variables and its first statement, before comments, between logical sections in a method
Strings
Use either double or single quotes, and stick to it. Split strings into multiple lines by concatenating. Braces
Use the “One-true bracing style”

Naming
Capitalize the names of constructor functions (Pascal case)
Name globals and constants in ALL_CAPS
Use camelCase
Variable names should begin with a noun, functions should begin with a verb.
Try and make the name suggest the dataType

NEVER DO THIS
Features that are somtimes useful, but occasionally dangereous are the worst parts
Leave off semicolons
Declare all variables at the site of first use (rely on block scope)
Use lots of global variables Check for null with typeof
Use null to test if an argument was supplied or test an uninitialized variable.
Use parseInt(string, radix) without the radix param set to 10
Rely on floating points: 0.1 + 0.2 !== 0.3 Check for NaN without using isNaN()
Rely on type coercision with ==, instead use === Modify things you don’t own
Use the with statement
Use the eval function, or pass setTimeout a string
Use the continue statement
Use fall-throughs on switch statements. Always break;
Leave the {} off of any kind of block-ish statement
Use bitwise operators
Use function declarations, use function expressions instead
Use new with built-in objects
Use void
Forget to use var when declaring variables
Invoke constructors without new
User-agent sniff
Assume that because a browser has one feature because it has other features
Leave a trailing decimal point, a leading decimal point.
Use octals
Leave a variable uninitialized. Always initialize them to atleast
null
Put “use strict” in the global scope
