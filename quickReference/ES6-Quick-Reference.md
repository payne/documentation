References
==========
Understanding ECMAScript 6 - Nicholas Zakas

Semicolons
===========
They are not required.

Dangling Commas
===============
They are allowed.

Unicode
========
Enforces UTF-16.

RegEx
------
There’s a new u flag for “unicode” in regex that will work on characters and not code units.

Strings
========
Identify strings in other strings
---------------------------------
Each of the following functions takes 2 arguments: a string to search and and optional place to start.  They can’t be passed regex.  Use indexOf() and lastIndexOf() to find positions of strings. 
includes()
Returns true if the text is found anywhere in the string and false if not.
startsWith()
Returns true if the text is found at the beginning of the string and false if not.
endsWith()
Returns true if the text is found at the end of the string and false if not.
repeat()
Repeats a string a cetain number of times.
RegEx
You can duplicate a regular expression 