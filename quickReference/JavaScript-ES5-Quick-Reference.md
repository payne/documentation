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
Falsy values: `false`, `null`, `undefined`, `‘’`, `0`, `NaN`

Comparisons
-------------------------------------------------------------------------------------------
`NaN` can only be compared by doing 
```javascript
isNaN(number);
```

It doesn’t equal anything, not even itself

`typeof null` will return `‘object’`` so always do `value === null` instead

`isFinite()` will reject both `NaN` and `Infinity`

`typeof array` will return `‘object’`. So you have to do the following: 
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
Need to use obj.hasOwnProperty(key) otherwise members in the prototype chain will be included
There is no guarantee on the order that for in uses
JavaScript does not provide tail recursion optimization
for
Cache the length of an array that’s being looped over, otherwise JavaScript will look up the length everytime. Not effecient