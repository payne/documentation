![ES6 Logo](https://cdn.sencha.com/img/20130807-es6.png)
ES6 Quick Reference
=====================

References
-------------
*Understanding ECMAScript 6* - Nicholas Zakas

Semicolons
-------------
They are not required.

Dangling Commas
-----------------
They are allowed.

Unicode
---------
Enforces UTF-16.

### RegEx
There’s a new u flag for “unicode” in regex that will work on characters and not code units.

Strings
---------
### Identify strings in other strings
Each of the following functions takes 2 arguments: a string to search and and optional place to start.  They can’t be passed regex.  Use `indexOf()` and `lastIndexOf()` to find positions of strings. 
`includes()`
Returns true if the text is found anywhere in the string and false if not.
`startsWith()`
Returns true if the text is found at the beginning of the string and false if not.
`endsWith()`
Returns true if the text is found at the end of the string and false if not.
`repeat()`
Repeats a string a certain number of times.

### RegEx
You can duplicate a regular expression.  You can pass in a flag to the constructor and it will override previous flags instead of throwing an error like ES5
```Javascript
var re1 = /ab/i,
// throws an error in ES5, okay in ES6
re2 = new RegExp(re1, "g");
```

Object.is()
------------
Makes for remaining inconsistencies with `===`
```JavaScript
console.log(Object.is(+0, -0)); // false
console.log(Object.is(NaN, NaN)); // true
```

Block Bindings
---------------
### let
Declares a variable, but keeps its scope to the current code block.  The variable won't be declared anywhere else.
```JavaScript
for (let i=0; i < items.length; i++) {
    process(items[i]);
}
// i is not accessible here
```
#### let in loops
`let` will create a new variable for each loop iteration so that if `i` is saved somewhere it won't be referencing the same number like in ES5
#### Temporal Dead Zone (TDZ)
A variable declared by `let` can't be accessed before it's declared.
```JavaScript
if (condition) {
    console.log(value); // ReferenceError!
    let value = "blue";
}
```
`value` is in the TDZ.
`typeof` will be a ReferenceError if it's used before `let` in the same block.  It will return `undefined` if used outside the code block.
You can't redeclare a `let` variable in the same block.  You can however declare a variable with the same name as a variable in the containing scope.
```JavaScript
var count = 30;
// Does not throw an error
if (condition) {
    let count = 40;
}
```
It's a good idea to put `let` declarations at the top of the block.

### const
The value of a `const` can't be reset. It has to be initialized with a value.
They are scoped within a block and can't be accessed outside of the block.
You can't declare a `const` with the same name as a variable that's allready been declared in the same scope.

Destructuring Assignment
-------------------------
### Object Destructuring
This is a shortcut thats lets you turn objects into local variables for easier referencing.
```JavaScript
var options = {
        repeat: true,
        save: false,
        rules: {
            custom: 10,
        }
    };
// later
var { repeat, save, rules: { custom }} = options;
console.log(repeat);        // true
console.log(save);          // false
console.log(custom);        // 10
```
If you don't want to use the existing key names as the variable names.  You can do this:
```JavaScript
var { repeat: localRepeat, save: localSave } = options;
console.log(localRepeat);       // true
console.log(localSave);         // false
```
If the property name doesn't exist on the object than a local variable gets created with a value of `undefined`
You have to put `var`, `let`, or `const` in front otherwise it breaks.  However, you can wrap it all in parens and not have a problem.
```JavaScript
({ repeat, save, rules: { custom }} = options);
```

### Array Destructuring
You an also destructure arrays and the original array isn't changed at all.
```JavaScript
var colors = [ "red", [ "green", "lightgreen" ], "blue" ];
// later
var [ firstColor, [ secondColor ] ] = colors;
console.log(firstColor);        // "red"
console.log(secondColor);       // "green"
```

### Mixed Destructuring
```JavaScript
var options = {
        repeat: true,
        save: false,
        colors: [ "red", "green", "blue" ]
    };
var { repeat, save, colors: [ firstColor, secondColor ]} = options;
console.log(repeat);            // true
console.log(save);              // false
console.log(firstColor);        // "red"
console.log(secondColor);       // "green"
```

Numbers
--------
### isFinite() and isNan()
There is now an `isFinite()` and `isNan()` that are part of the `Number` object instead of being global.  They return false if passed non-numeric values unlike their global counterparts.  

