Java Quick Reference
========================================================================================

* [References](#references)

References
-------------------------------------------------------------------------------------------
*Core Java Volume 1 Tenth Edition* - Cay S. Horstmann

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

You need to run it with the `.java` extension
```bash
javac Welcome.java
```

`java` runs the Java Virtual Machine and executes code in the `.class` files

You don't need an extension when you execute class files
```bash
java Welcome
```

Access Modifiers
-------------------------------------------------------------------------------------------
*public*

Class
-------------------------------------------------------------------------------------------
Everything in Java lives inside a class

Class names must begin with a letter and can be any combination of letters or digits after that.  Reserved words can't be class names

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

You can set `char` to unicode values like this `\u0008`.  You can also use the unicode notation outside of quoted characters and strings in regular code.

Unicode is processed before code is parsed.  Unicode in comments can be dangerous as well

It's better to avoid `char` and just use `Strings` unless you are minuplating UTF-16 code units

### boolean
You can't convert between integers and booleans

Variables
-------------------------------------------------------------------------------------------
You first declare *type* then *variable*

Must start with letter and must be a sequence of letters and digits

Don't use `$` because it used by the compiler

You can't use unitialized variables or you'll get an error

You can declare variables anywhere you want

### Constants
Use `final` to denote a constant.

Convention is to name them in all uppercase

To setup a constant that is available to the entire `class` use `static final` like so:
```java
public class Constants2 {
   public static final double CM_PER_INCH = 2.54;

   public static void main(String[] args) {}
}
```

If you make a constant `public` it can be accessed by other classes

Operators
-------------------------------------------------------------------------------------------
If you add `strictfp` to a method it will force floating-point operations to have reproducible results.

Integer division by 0 raises exception.  Floating-point division by 0 yeilds `infinite` or  `NaN`

Math Functions
-------------------------------------------------------------------------------------------
