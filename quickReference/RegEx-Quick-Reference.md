RegEx Quick Reference
========================================================================================

* [References](#references)
* [Choice](#choice)
* [Sequence](#sequence)
* [Factor](#factor)
* [Escapement](#escapement)
* [Group](#group)
* [Class](#class)
* [Quantifier](#quantifire)
* [Examples](#examples)

References
-------------------------------------------------------------------------------------------
*JavaScript the Good Parts* - Douglas Crockford

Sloppy regular expressions are a popular security exploit.

Simplicity is the best strategy

Choice
-------------------------------------------------------------------------------------------
Contains one or more regex spearated by the `|` character. 
```javascript
/(in|into)/
```
If the first item is matched, the second will be ignored

Sequence
-------------------------------------------------------------------------------------------
One or more regexp factors that can be followed by a quantifier. If no quantifier is provided, it will only be matched once

Factor
-------------------------------------------------------------------------------------------
Can be a character, a group, a class, or an escape sequence.

All characters are treated literally except for the control characters and special characters.

Any special character can have a \ placed before it to make it literal

### Special Characters
`.` will match any character except a line-ending character

`^` will match the beginning of a text. Can match line-end if `m` flag is given

`$` will match the end of a text. Can match line-end if `m` flag is given

Escapement
-------------------------------------------------------------------------------------------
Similar to strings with some differences 

`\f` - formfeed character

`\n` - newline character

`\r` - carriage return character

`\t` - tab character

`\u` - unicode character

`\b` - word boundary, NOT the backspace, relies on `\w` 

`\d` - matches a digit, same as `[0-9]`

`\D` - opposite of `\d`

`\s` - Partial set of whitespace characters

`\S` - opposite of `\s`

`\w` - same as `[0-9A-z_a-z]`, not very useful with any real language. JavaScript regex, is not very supportive of internationalization

`\W` - opposite of \w

Group
-------------------------------------------------------------------------------------------
Capturing: Denoted by `()`. Each group can be referenced by a number in order of appearance

`\1` - reference to capture group 1, `\2` reference to capture group 2, etc...

Non-capturing: Denoted by `(?: )`. Slightly faster than capturing, and doesn’t interfere with capturing numbering

Positive lookahead: Denoted by `(?= )`. Don’t use this. 

Negative lookahead: Denoted by `(?! )`. Don’t use this.

Class
-------------------------------------------------------------------------------------------
Specify a set of characters. Denoted by `[]`. Simpler to use than a non-capturing group.

Can specify a range of characters by using the `-`

If you place a `^`` at the beginning of the class, then the specified characters will be excluded

### Escapement
Same as for [factor](#factor) except `\b` is the backspace character

Quantifier
-------------------------------------------------------------------------------------------
Place it after a factor to specify how many times to match it 

`{3}` - will match 3 times

`{3,6}` - will match 3, 4, 5, or 6 times

`{3,}` - will match 3 or more times


`?` - same as `{0,1}`

`*` - same as `{0,}`

`+` - same as `{1,}`

By default matching is *“greedy”* and will match as many times as possible up to the limit. It is best to stick with this method.

You can add a `?` to the end of a quantifier it will make it *“lazy”*, matching as few times as possible.

Examples
-------------------------------------------------------------------------------------------
Doubled words:
```javascript
/([A-Za-z\u00C0-\u1FFF\u2800-\uFFFD]+)\s+\1/gi;
```

Parse Number:
```javascript
/^-?\d+(?:\.\d*)?(?:e[+\-]?\d+)?$/i;
```

Parse Url:
```javascript
/^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/;
```
