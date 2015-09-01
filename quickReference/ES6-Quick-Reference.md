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
```JavaScript
console.log(isFinite("25"));            // true
console.log(Number.isFinite(25));       // true
console.log(Number.isFinite("25"));     // false
```

### parseInt() and parseFloat()
They are now part of the `Number` object

### isInteger()
Helps determine if value is an integer.  Some numbers that look like floats may not be floats though.
```JavaScript
console.log(Number.isInteger(25));      // true
console.log(Number.isInteger(25.0));    // true
console.log(Number.isInteger(25.1));    // false
```

### Safe Integers
Some really big and small numbers can't be represented by JavaScript.  You can check this with the `isSafeInteger()` function.  This is good to do as part of input validation.
```JavaScript
var inside = Number.MAX_SAFE_INTEGER,
    outside = inside + 1;
console.log(Number.isInteger(outside));         // true
console.log(Number.isSafeInteger(outside));     // false
```

### Math
There's a bunch new math functions.  Checkout the `Math` object before writing it yourself.  Some good one's include:
    * `Math.sign(x)`  Returns -1 if the x is negative, 0 if x is +0 or -0, or 1 if x is positive.
    * `Math.trunc(x)` Removes fraction digits from a float and returns an integer.

Functions
---------
### Default Params
You can specify default values for when a param isn't formally passed
```JavaScript
function makeRequest(url, timeout = 2000, callback = function() {}) {
    // the rest of the function
}
```
Parameters with default values are *optional* and those with out a default are *required*
If you pass in `undefined` the default value will be used.  `null`, however is valid and won't trigger the default.  
A default value doesn't have to be primitive.  It can be calculated
```JavaScript
function getCallback() {
    return function() {
        // some code
    };
}
function makeRequest(url, timeout = 2000, callback = getCallback()) {
    // the rest of the function
}
```

### Rest Parameters
Indicated by using `...paramName`.  The names parameter becomes an Array containing the rest of the parameters. You can't have any named parameters after the rest parameter.  This is intended to replace the `arguments` object.

### Destructured parameters
Makes it possible to see exactly what object properites are expected to be passed into a function as optional parameters.  Instead of just a mysterious object parameter.
```JavaScript
function setCookie(name, value, { secure, path, domain, expires }) {
    // ...
}
setCookie("type", "js", {
    secure: true,
    expires: 60000
});
```
Destructured parameters are optional and are `undefined` if not passed in.  However, the actual object needs to be passed in otherwise it will be an error unless you make a default for it:
```JavaScript
function setCookie(name, value, { secure, path, domain, expires } = {}) {}
```
It's recommended to always provide a default argument for a destructured parameter.

### Spread Operator
Will split an array and pass in its individual, separate arguments to a function.  You use the same `...` as the Rest parameters
```JavaScript
let values = [25, 50, 75, 100]
// equivalent to
// console.log(Math.max(25, 50, 75, 100));
console.log(Math.max(...values));  
```
You can mix and match other arguments with the spread operator:
```JavaScript
let values = [-25, -50, -75, -100]
console.log(Math.max(...values, 0));        // 0
```

### Name property
All functions in ES6 have an appropriate value for their `name` property.
```JavaScript
function doSomething() {}
var doAnotherThing = function() {};
console.log(doSomething.name);          // "doSomething"
console.log(doAnotherThing.name);       // "doAnotherThing"
```
Function expressions names take priority over variables to which they are assigned.
```JavaScript
var doSomething = function doSomethingElse() {};
console.log(doSomething.name);      // "doSomethingElse"
```
Getter and setter functions have `get ` or `set ` added to the front of the function name.
```JavaScript
var person = {
    get firstName() {
        return "Nicholas"
    },
    sayName: function() {
        console.log(this.name);
    }
}
console.log(person.sayName.name);   // "sayName"
console.log(person.firstName.name); // "get firstName"
```
Functions created with `bind()` will have `bound` added to the front.  Functions created with the `Function()` constructor  will be called `anonymous`
```JavaScript
var doSomething = function() {};
console.log(doSomething.bind().name);   // "bound doSomething"
console.log((new Function()).name);     // "anonymous"
```

### new.target property
Lets you safely determine if a function was called with `new`
```JavaScript
function Person(name) {
    if (typeof new.target !== "undefined") {
        this.name = name;   // using new
    } else {
        throw new Error("You must use new with Person.")
    }
}
var person = new Person("Nicholas");
var notAPerson = Person.call(person, "Michael");    // error!, but not in ES5
```
You can also use it to determine which constructor was used.
```JavaScript
function Person(name) {
    if (typeof new.target === Person) {
        this.name = name;   // using new
    } else {
        throw new Error("You must use new with Person.")
    }
}
function AnotherPerson(name) {
    Person.call(this, name);
}
var person = new Person("Nicholas");
var anotherPerson = new AnotherPerson("Nicholas");  // error!
```


### Block-level function
You can use function declarations inside a block and they'll only be accessable inside that block.  They are hoisted to the top of the block they are defined in.  Function expressions made with `let` are not hoisted.  
**Note:** In *non-strict mode* function declarations are hoisted to the containing function or global environment.

### Arrow Functions
* Value of `this` inside the function is determined by where the function is defined not where it is used.
* They can't be used as constructors
* The value of `this` can't be changed
* There is no `arguments` object.
You declare one by declaring the arguments, the arrow, then the body of the function.
```JavaScript
var reflect = value => value;
// effectively equivalent to:
var reflect = function(value) {
    return value;
};
```
If you pass in one or more arguments you have to put parents around them.
You need to include curly braces around the body to have more than one expression and include a `return` statment.
You can create an IIFE by doing this:
```JavaScript
let person = ((name) => {
    return {
        getName() {
            return name;
        }
    };
})("Nicholas");
console.log(person.getName());      // "Nicholas"
```
The parens have to be only around the arrow function definition.

#### Lexical this Binding
Arrow functions have implicit `this` binding.  `this` always refers to the scope in which the arrows function was defined.
```JavaScript
var PageHandler = {
    id: "123456",
    init: function() {
        document.addEventListener("click",
                event => this.doSomething(event.type), false);
    },
    doSomething: function(type) {
        console.log("Handling " + type  + " for " + this.id);
    }
};
```

Arrow functions are meant to be thrown away and not used to create new types.  You can't use `new` inside of them.  They don't have a `prototype` property.  The arrow functions are really good for using as callbacks and with Array functions.

#### Lexical arguments Binding
An arrow function always has access to the `arguments` object of its containing function.
```JavaScript
function createArrowFunctionReturningFirstArg() {
    return () => arguments[0];
}
var arrowFunction = createArrowFunctionReturningFirstArg(5);
console.log(arrowFunction());       // 5
```

#### Identi
