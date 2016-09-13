Java Quick Reference
========================================================================================

* [References](#references)

References
-------------------------------------------------------------------------------------------
*Core Java Volume 1 Tenth Edition* - Cay S. Horstmann
[Lynda course on IntelliJ](https://www.lynda.com/Development-Tools-tutorials/Overview-IDEs-Java/486760-2.html)

Environment
-------------------------------------------------------------------------------------------
### Definitions
* Applets: Java programs that work on web pages.
* Java JDK (Java Development Kit): This is what allows developers to write Java
* Java SRE (Java Runtime Environment): Has the virtual machine that runs java code.  For end users.  Doesn't have a compiler
* Java SE (Java Standard Edition): Basic Java for Desktop
* Java EE (Java Enterprise Edition): Java for complex enterprise systems
* Java ME (Java Micro Edition): Java for phones

Install JDK
-------------------------------------------------------------------------------------------
Download JDK from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads)

On mac it will be installed to `/Library/Java/JavaVirtualMachines/jdk1.8.0_version.jdk/Contents/Home`

See if it's installed correctly by doing this:
```bash
javac -version
# Should return something like javac 1.8.0_74
```

Command Line
-------------------------------------------------------------------------------------------
Java is case sensitive

`javac` is the Java compiler.  It compiles `.java` files into `.class` files.
The `.class` files are the bytecode for java.

You need to run it with the `.java` extension
```bash
javac Welcome.java
```

`java` runs the Java Virtual Machine and executes code in the `.class` files

You don't need an extension when you execute class files
```bash
java Welcome
```

You can run the compiler with *wildcards*
```zsh
javac Employee*.java
```

If the Java compiler sees a class being used in a file it will search for a file with the class
name and compile it.  If the timestamp is newer it will automatically recompile it


Class
-------------------------------------------------------------------------------------------
Everything in Java lives inside a class

Class names must begin with a letter and can be any combination of letters or digits after that.
Reserved words can't be class names

Class name convention is a noun with a capital letter with each additional word in camelCase

The file name for the class must match the `public` class name, case and everything, with `.java` as the extension

### main
When you use `java` to run a compiled program execution always starts with the `main` method

The `main` method must be declared `public`

System.out
-------------------------------------------------------------------------------------------
`println()` prints a console message with a new line

`print()` prints a console message with no new line

Comments
-------------------------------------------------------------------------------------------
`//` single line

`/* */` block comment

### Javadoc
`/** */`

Primitive Types
-------------------------------------------------------------------------------------------
Every variable must have a declared type

### Integers
Not fractional numbers

Negative values are allowed

| int   | -2,147,483,648 to 2,147,483,648                         |
| short | -32,768 to 32,768                                       |
| long  | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,808 |
| byte  | -128 to 127                                             |

`int` is sufficient for most things

### Floating-point
`float` use only when necessary.  Not as precise.  As an `F` at the end (e.g. 3.14F)

`double` twice as precise as a float

`NaN` Can check if a `double` is `NaN` using `Double.isNaN(x)`

### char
Some unicode symbols can be done with one `char` value, others require 2

Literal values are enclosed with single quotes `'A'` not double quotes `"A"`

You can set `char` to unicode values like this `\u0008`.
You can also use the unicode notation outside of quoted characters and strings in regular code.

Unicode is processed before code is parsed.  Unicode in comments can be dangerous as well

It's better to avoid `char` and just use `Strings` unless you are manipulating UTF-16 code units

### boolean
You can't convert between integers and booleans

Variables
-------------------------------------------------------------------------------------------
You first declare *type* then *variable*

Must start with letter and must be a sequence of letters and digits

Don't use `$` because it used by the compiler

You can't use uninitialized variables or you'll get an error

You can declare variables anywhere you want

### Constants
Use `final` to denote a constant.

Constants must be initialized.

Convention is to name them in all uppercase

To setup a constant that is available to the entire `class` use `static final` like so:
```java
public class Constants2 {
   public static final double CM_PER_INCH = 2.54;

   public static void main(String[] args) {}
}
```

If you make a constant `public` it can be accessed by other classes

It's best to only use constants with `immuable` objects or primitives

Operators
-------------------------------------------------------------------------------------------
If you add `strictfp` to a method it will force floating-point operations to have reproducible results.

Integer division by 0 raises exception.  Floating-point division by 0 yields `infinite` or  `NaN`

### Math Functions
There is a `Math` class you can use for math things.

`Math.sqrt(x)` Takes the square root of a number.
*sqrt* is a static method.  It doesn't operate on any object.

`Math.pow(x, a)` is the only way to raise a number to an exponent.  It returns a double and takes
doubles as its arguments

`Math.floorMod` will do a modulus calculation, but it will always return a positive number (in
case the first part of the modulus is a negative number.

You can avoid using the `Math` prefix everywhere if you importing the Math class:
`import static java.lang.Math.*;`

You can use the `StrictMath` class if precision is more important than performance

### Converting Between Numerical Types
![Numeric Types Diagram](http://1.bp.blogspot.com/_XSXKYiMaow8/SEpInFPUvTI/AAAAAAAAABU/g6g8CsxYijw/s400/Java4.png)
Solid arrows mean no data will be lost in the conversion, dotted arrows mean some precision will
be lost

When two different types are used in an operation they will be converted to a common type first:
* If one is `double`, they will both be `double`
* If one is `float` they will be both be `float`
* If one is `long`, they will both be `long`
* Otherwise they will both be `int`

### Casts
When casts are performed data is lost.

You do a cast like this:

```java
double x = 9.997;
int nx = (int) x;
```

`Math.round(x)` will a round a floating point to the nearest integer:

```java
double x = 9.997;
int nx = (int) Math.round( x);
```

**Warning:** If you try and cast to a type that can't hold the value, you will get a truncated
number with a different value.

### Increment and Decrement Operators
Don't use them inside expressions, because they cause weird bugs.

```java
int m = 7;
int n = 7;
int a = 2 * ++ m; // now a is 16, m is 8
int b = 2 * n++; // now b is 14, n is 8
```

### Boolean Operators
`&&` has higher precedence over `||`

Fundamental Types
-------------------------------------------------------------------------------------------
### Enums
```java
enum Size { SMALL, MEDIUM, LARGE, EXTRA_LARGE };
Size s = Size.MEDIUM;
```

### Strings
You can make a substring with `String.substring(beg, end)`
```java
String greeting = "Hello";
String s = greeting.substring(0, 3); // "Hel"
```

You can concatenate with `+`.
When you concatenate with non-strings they will be turned to strings

You can join strings together with delimiter with `String.join(del, str1, str2)`

Strings are immutable, so you have to do things like this.
```java
greeting = greeting.substring(0, 3) + "p!";
```

To test if strings are equal use `s.equals(a)` or `s.equalsIgnoreCase(s)`

Empty string
```java
if (str.length() == 0)
if (str.equals(""))
```

is different than `null` string
```java
if (str == null)
```

#### Building Strings
It expensive to build all strings using concatenation, because you have to save each new string in
memory.  Instead use the `StringBuilder` class.
```java
StringBuilder builder = new StringBuilder();
builder.append(ch) // append single character
builder.append(str) // append string
String completedString = builder.toString();
```

Console input/output
-------------------------------------------------------------------------------------------
You have to use the `Scanner` class
You must import it from `java.util.*`. (Any class not defined in `java.lang` must be imported)
```java
Scanner in = new Scanner(System.in);
```

The `nextLine` method reads the next line of input
```java
System.out.print("What is your name?");
String name = in.nextLine();
```

`next` reads the next word
`nextInt` reads the next integer
`nextDouble` reads a double

To read a password you need to use the `console` class
```java
Console cons = System.console();
String username = cons.readLine("User name:");
char[] passwd = cons.readPassword("Password:");
```

Formatting Console Output
-------------------------------------------------------------------------------------------
Can use `System.out.printf`
```java
System.out.printf("%8.2f", x);
```

You can specify multiple arguments to `printf` and each *format specifier* that starts with `%`
will get replaced with corresponding argument

You can use an index number immediately after the `%` to point to specific arguments. The number
must have a `$` after it. Indices start at 1 not 0.
```java
System.out.printf("%1$s %2$tB %2$te, %2$tY", "Due date:", new Date());
// Due date: February 9, 2015
```

You can also use `<` to indicate that argument from the preceding statement should be used again

There are also flags and different types of *format specifiers* you can use

`String.format` creates a formatted string using these same rules

File Input/Output
-------------------------------------------------------------------------------------------
Use the `Scanner` class.
```java
Scanner in = new Scanner(Paths.get("myfile.txt"), "UTF-8");
```

Backlashes will need to be escaped with another backslash.
You should specify the character encoding otherwise it will default to the encoding used by the
computer the JVM is running on, which will lead to unexpected results

Use the `PrintWriter` class to write to files.
```java
PrintWriter out = new PrintWriter("myfile.txt", "UTF-8");
```

If the file path doesn't exist it will be made.
You use the `println`, `print`, and `printf` methods like on `System.out`

If you use relative file paths in your file names they will be constructed based on the directory
where the JVM was started.  It's probably better to use absolute paths to avoid problems. However,
you can get the JVM starting directory with `String dir = System.getProperty("user.dir");`

If a file path isn't found an exception will be thrown.  You should let the `main` method know that
input/output exceptions might be thrown.
```java
public static void main( String[] args) throws IOException {
   Scanner in = new Scanner( Paths.get(" myfile.txt"), "UTF-8");
   ...
}
```

Control Flow
-------------------------------------------------------------------------------------------
### Block scope
Can't redefine inner variables in nested blocks

### For loops
Unwritten rule to only use one counter variable.

If a counter variable is a `double` the loop may never end because of rounding errors

### For Each
```java
for (variable : collection) statement
```

The collection in the loop must be an `array` or something that implements the `Iterable` interface
such as an `ArrayList`

### Switch statements
Fallthroughs are possible, so make sure you always use a `break;`

When using an `enum` in the switch you don't have to specify the name of the `enum` in each `case`
statement.  It will be deduced from the switch statement.

Big Numbers
-------------------------------------------------------------------------------------------
You can use `BigInteger` or `BigDecimal` if `int` or `float` precision isn't precise enough.

Use `valueOf` to convert a regular number to a big number.

You can't use regular math operators to combine big numbers, so you have to use methods like `add`
and `multiply`

Arrays
-------------------------------------------------------------------------------------------
All array elements must be same type.  You declare the type as part of the declaration.  You have
to initialize the array with the `new` keyword and give it the length of the array
```java
int[] a = new int[100];
```

Arrays of numbers are initialized with each number being 0.
Arrays of boolean are initialized with each value being false.
Arrays of objects (including `String`) are initialized with each value being `null`.

You can't change the size of an array once it's created.  However you can change the size of an
*Array List*

Use `Arrays.toString(a)` to print all the values of an array

You can initialize an array with values using the following syntax
```java
int[] smallPrimes = { 2, 3, 5, 7, 11, 13 };
```

You can reinitialize an array like this:
```java
smallPrimes = new int[] { 17, 19, 23, 29, 31, 37 };
```

You can copy an array into a different variable, but then both variables will point to the same
array and changing the array with one variable will change it in the other as well.
If you want a completely new copy you must use `Arrays.copyOf(a, len)`.  The second param is the
new length, which you can use to change the size of the array.

Use `Arrays.sort(a)` to sort an array.  It uses the *QuickSort* algorithm.

You can define a Multidimensional array (matrix) like this:
```java
double[][] balances = new double[NYEARS][NRATES]
```

You can print all the values of a multidimensional array with
`System.out.println(Arrays.deepToString(a));`
You can make *ragged arrays*, which are multidimensional arrays where the rows have different
lengths

Object Oriented Programming
-------------------------------------------------------------------------------------------
### Constructors
Constructors always have the same name as the class name

Object variables don't contain objects.  They only refer to them
```java
Date deadline = new Date();
```

You can explicitly set an object variable to `null` to indicate it doesn't refer to an object yet

You can overload a constructor so you can have multiple signatures

It's a best practice not to use variable names that are the same as your class properties

It's a best practice to put `this` in front of class properties to distinguish them from local
variables



### Access Modifiers
`public`

It's a best practice to make all *instance fields/properties* `private`.  This guarantees there
won't be corruption.  It is ok to have `constants` that are publicly accessible.

Using methods to mutate properties rather than making the properties public is nice because
mutator methods can perform validation.

Make sure your accessor methods don't return references to *mutable* objects like `Date`. Instead
you should clone the object.

A method can access the `private` data of any objects it uses which are of the same class.

### Static
If something is `static` there is only one field per class instead of each object having it's
own copy

Static methods can't access `this`, but they can access static fields.

You can use objects to call `static` methods, but it's confusing, so you should only use classes
to call `static` methods.

You should use `static` methods when a method has all it's parameters defined and doesn't need
`this` or only needs access to `static` fields.

You can use `static` methods as *factory methods* to generate object instances.  This is useful
when you want to construct an object other than the type of class (constructors only return `this`)
or when you want to construct objects using different names (constructors can only be the name
of the class)

### Method Parameters

Java ALWAYS passes parameters by *value* and not by *reference*.  However, when an initialized
object is passed it is a copy of a reference to an object, so both the parameter and the
original object will have their values changed.

Dates
-------------------------------------------------------------------------------------------
*UTC* stands for Coordinated Universal Time, which is basically the same as GMT or
Greenwich Mean Time

The `Date` class refers to points in time and the `LocalDate` class expresses days in the
familiar calendar notation

You don't use a constructor with `LocalDate` instead you use static factory methods
```java
LocalDate.now();
LocalDate.of(1992, 12, 31);
```

Main Method
-------------------------------------------------------------------------------------------
The often has `String[] args` in it, which means it excepts an array.  This array is the stuff
you pass from the command line

Any class can have a `main` method.  This can be helpful for unit testing

Annotations
-------------------------------------------------------------------------------------------
Used to send messages to the compiler or process Java class or source files


