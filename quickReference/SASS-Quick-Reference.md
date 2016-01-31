![SASS Logo](http://tdreitz.github.io/images/langs/sass-logo.png)
SASS Quick Reference
========================================================================================

* [References](#references)
* [Install](#install)
* [Partials](#partials)
* [Variables](#variables)
* [HTML](#html)
* [Nesting](#nesting)
* [Extending](#extending)
* [Mixins](#mixins)
* [Color](#color)
* [Clearfix](#clearfix)
* [Grids with Susy](#grids-with-susy)
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
*Sass and Compass for Designers* - Ben Frain

Install
-------------------------------------------------------------------------------------------
### Check available versions
```bash
gem list sass -a -r
```
`-a` means to list all versions, `-r` means to do a remote call

### Create a new compass project
```bash
compass create my-project
```
This will create 
* A `.sass-cache` folder that is used to cache files and build css faster
* A `sass` folder to put sass files in
* A `stylesheets` folder to put the compiled css files in
* A `config.rb` file that has the config defaults for the project.

#### Custom folder names
You can change the folder names that the create command spits out by using 
* `--sass-dir` 
* `--css-dir` 
* `--javascripts-dir` 
* `--images-dir`

These arguments won’t necessarily create folders, but it will make the correct paths in the `config.rb` file.

#### Bare project
Compass automatically makes some scss and css files in the directories it generates. If you don’t use those add the `--bare` argument

### Config.rb file
When making changes, you may need to clear the `.sass-cache` before the changes will be seen.
```bash
compass clean
```
You’ll have to rerun the `watch` command.

#### Include plugins
```ruby
# Require any additional compass plugins here
require “plugin-name”
```

#### Path names
```ruby
# Set this to the root of your project...
http_path = “/”
css_dir = “css”
...
```
All paths will be relative to the `http_path`

You can also add an optional `fonts_dir`

Any scss files in the specified `sass` folder will get compiled to css

#### CSS Output Style
* `:expanded` - This will make normal css
* `:nested` - This will make css that is nested based on selectors 
* `:compact` - This will make single line css. Loud comments will still be kept.
* `:compressed` - Removes comments and whitespace and makes production ready code

To remove the comments that say what line the css came from make sure the `line_comments = false` is uncommented

#### Relative Assets
```ruby
background-image: url(‘../img/image.jpg’);
```
This is the standard way. Images aren’t being located relative to the image directory in `config.rb`
```ruby
background-image: image-url(‘image.jpg’);
```
If you uncomment `relative_assets = true` it will make it so that you can use the compass `image-url` helper instead of the typical css `url` function. This will make it so that images are located relative to the image directory in `config.rb`

There is also a `font-url` helper that will make it so that fonts are looked up relative to the `fonts_dir` path in the `config.rb`

### Automatic compiling
From the root of the project do `compass watch`, which will recompile the css everytime a sass file changes.

### Manual compile
To do a one-off compile run:
```bash
compass compile --output-style compressed --force
```
You can change the output style to what you want.

### Removing vendor prefixes
Change the values for the vendor defaults before compass is imported to make the changes globally, otherwise change the values in the necessary scss file.

#### Removing old IE support
```sass
$legacy-support-for-ie6: false;
$legacy-support-for-ie7: false;
```

#### Opera
Opera is now webkit based, so you can do this:
```sass
$experimental-support-for-opera: false;
```

### Experimental CSS
```sass
@include experimental(property, value);
```
Use the experimental mixin to add experimental vendor support for css properties that Compass hasn’t made a mixin for yet.

```sass
@include experimental-value(property, value);
```
Use this mixin, for when the value of a property is experimental and needs vendor support.

Partials
-------------------------------------------------------------------------------------------
Using `@import url(‘header.css’)` will let you break up your css, but it slows your site down, because it does separate http requests.

Filenames for partials look like this: `_mypartial.scss` 

Include them in a style like this: `@import “mypartial”` 

Variables in a partial will be accessable to the importer.

If you omit the underscore from the filename the partial will be compiled to it’s own css file.

### Globbing
Install the SASS globbing plugin to be able to import a whole folder of partials at once. 

However, the files will be imported in alphabetical order. 

This could break things if the order of your partials is important.
```bash
gem install sass-globbing
```

Variables
-------------------------------------------------------------------------------------------
Often a good idea to define all your variables in a partial.

Use the `$` to define the start of a variable. 

Use a `;` to indicate the end of a variable name.

### Lists
You can make lists with a regular variable definition and a _space-delimited_ list of items.
```sass
index($number, $list);
```
Retrieves an item from a list by it’s index.

Comments
-------------------------------------------------------------------------------------------
```sass
/* normal css comment */
// Sass single line comment Sass comments won’t be output to css.
/*! I am a loud SASS Comment */
```
Loud comments will be outputed no matter what.

HTML
-------------------------------------------------------------------------------------------
Reference stylesheets just like you would normally, just point the links to the outputted css directory.

Nesting
-------------------------------------------------------------------------------------------
If the styles can be reused elsewhere nesting may make them too specific. 

Avoid going deeper than _3 levels_, and don’t make rules more specific than they need to be.

Avoid using IDs as selectors. It’s ok to, but use classes where possible.

```sass
a {
  color: $color7;
  &:hover, &:focus {color: $color5;}
}
```
Becomes
```css
a{color: blue;}
a:hover, a:focus {color: #007fff;}
```

### Parent selector
The `&` references the parent selector. 

You can put it after a nested child selector to make the parent selector change when there is a different grandparent
```sass
.main{
  .content{width: 70%;}
  .content & {width: 100%;}
} 
```
You can also use the parent selector to chain classes
```sass
.selector-one {
  &.selector-two {color: green;}
}
```
Becomes
```css
.selector-one.selector-two {color: green;}
```

### Namespaced properties
You can nest namespaced properties like `border` and `font` 
```sass
.nesting-namespace{
  border: {
    top: 1px dashed $ color7;
    right: 1px dotted $ color5;
  } 
}
```
Becomes
```css
.nesting-namespace{
  border-top: 1px dashed blue;
  border-right: 1px dotted #007fff;
}
```

Extending
-------------------------------------------------------------------------------------------
If there are a few elements that share some common styles they are prime candidates for `@extend`
```sass
.box {
  padding: 2em;
  color: $ color10;
} 
.warning-box {
  @extend .box;
  border: 2px dotted $color1;
}
```

### Placeholder selectors
If a rule is being made just for the sake of extending it use a *placeholder selector* and the extra rule won’t be compiled. 
```sass
%box {
  padding: 2em;
  color: $ color10;
}
```

Mixins
-------------------------------------------------------------------------------------------
```sass
@mixin bs($bs-type) {
  -webkit-box-sizing: $bs-type;
  -moz-box-sizing: $bs-type;
  box-sizing: $bs-type;
}
```

### Default values
```sass
@mixin bs($bs-type: border-box) {
  -webkit-box-sizing: $bs-type;
  -moz-box-sizing: $bs-type;
  box-sizing: $bs-type;
}
```
Include it like this:
```sass
@include bs
```

### Default values as global variables
This lets mixins get carried from one project to another, and only a global variable needs to change which will affect all mixin instances
in the project. 

Add the `!default` flag to a variable declaration and if that variable hasn’t been defined anywhere else (even above) then the defintion with the flag will be used.
```sass
$defined-bs-type: border-box;
$defined-bs-type: sausage !default;
@mixin bs($bs-type: $defined-bs-type) {
  -webkit-box-sizing: $bs-type;
  -moz-box-sizing: $bs-type;
  box-sizing: $bs-type;
} 
```

Color
-------------------------------------------------------------------------------------------
```sass
background-color: lighten(#eee, 93.5%); 
border-top: 2px solid darken($color11, 13.5%); 
complement($somecolor);
```
Computes a value that is 180 degress opposite on the HSL color wheel.
```sass
invert($somecolor);
```
Just like `complement`, except it doesn’t mess with opacity at all.
```sass
adjust-hue($color1, -90deg);
```
Similar to `complement`, except you can specify how many degrees to move on the color wheel.
```sass
saturate($color1, 80%);
desaturate($color1, 80%);
transparentize($color1, .5);
```
Will take any kind of color value and add an alpha channel. 

Makes a color more opaque. 

The `fade-out` function does the same thing. 

`opacify/fade-in` do the exact opposite.
```sass
rgba(red, .9);
```
Will turn a `hex` value into an `rbga` value. 

If the given opacity isn’t between `1` and `0`, the returned value will be a hex or named css color.
```sass
grayscale($color1);
```
Converts the color to grayscale.
```sass
mix($color1,$color2,60%);
```
Mixes 2 colors. The 3rd param, determines how much of the first color is mixed with the second.
```sass
adjust-color($color1, ...);
```
Any color property can be manipulated by using the relevant keyword argument. 

`$red`, `$green`, `$blue`, `$hue`, `$saturation`, `$lightness`, `$alpha`. 

You can’t do both HSL and RGB arguments at the same time.
```sass
scale-color($color, ...)
```
Is like `adjust-color` except that it bases the color change by what the color already is. 

If `$lightness` is changed for example, the color’s current lightness will be used as the 100% point, and adjustments will move from there.
```sass
$shade($color1,60%);
$tint($color1,60%);
```
`shade` mixes the color with a percentage of black, while `tint` mixes it with white.

Clearfix
-------------------------------------------------------------------------------------------
A clearfix is for elements that are floated inside a block element that doesn’t have a float. 

With Compass you don’t have to make a separate class for this, you can instead just use `@include clearfix;`

You can put this in a placeholder selector and extend it, that way all the selectors that need clearfix code will get combined into a single selector.

Grids w/ Susy
-------------------------------------------------------------------------------------------
Use the “Susy” Compass plugin.
```bash
gem install susy
```
Add `require “susy”` to the top of the `config.rb` file

Include `@import “susy”` at the top of your scss file.

### Settings
* `$total-columns` - The numer of columns for the grid.
* `$column-width` - The width of each column, can be em/px
* `$gutter-width` - The amount of space between each column
* `$grid-padding` - The space at either side of the grid
* `$border-box-sizing` - Whether or not to use border-box styling
* `$container-style: fluid` - Makes susy use a `fluid` grid (fills all available space) instead of an `elastic` grid (flexes to a point then is fixed). You can also set the setting to `static` which will make the grid static until it hits relevant breakpoints.
* `$container-width: 80%` - Sets a percentage width for a fluid grid container.

### Context
The grid doesn’t do anything until one or more elements is set as the _container element_. Use the `container` mixin on a selector to make it the context for a grid.

Use the `susy-grid-background` mixin to show the columns 

### Breakpoints
```sass
$M: 47em;
nav[role=”navigation”]{
  @include at-breakpoint($M){
    @include span-columns(3,12);
  } 
}
```
What’s enclosed in the `at-breakpoint` mixin, is what will happen to the selector at the given breakpoint.

`span-columns(3,12)` This mixin tells Susy how many columns an element should span.

`span-columns(9 omega, 12)` You can include the `omega` argument to tell Susy that an element is the last set of column space in the grid, which will float the element to the opposite direction of the flow. 

`omega` also removes margin on one side.

With some setting changes, you can make Susy do right-to-left layouts,

### Helpers
`prefix(1,12)` Adds a column of space before a selector. 

Pass the number of columns that need a prefix, and then the context (12, if you have a 12 column grid.)

`suffix(1,12)` Adds a column of padding to the end of a selector. Pass the number of columns, and the number of columns in your grid.

`pad(1,1,12)` You can split the difference and add some padding to both sides of an element. 

Args: number of left columns, number of right columns, the context.

`pre(1)` Adds margin before an element. 

Pass in the number of columns worth of margin to add.

`post(3)` Opposite of pre

`squish(2,2,12)` Like pad, but for margin. This will make things look weird if you apply it something that has `omega`, because `omega` removes the margin on one side.

`push(1)` `pull(1)` 

`push` works just like `pre`. 

`pull` adds a negative margin before an element. This won’t have effect on an `omega` element.

### Nested Grids
`with-grid-settings(4, 12em, 1.5em, 0)`

Lets you create a new grid with different settings. 

Args: number of columns, width of each column, gutter width of each column, any padding on the outside of the grid. 

Any rules that need the new grid should be nested within the mixin.

`nth-omega(4n)`

A shortcut for setting margins on the last item. You pass in the selector number that is the last one. 

It defaults to the the last item.

### Container relative positioning
Container relative positioning positions items relative to the inside edge of the containing element. 

Some dumb browsers round pixel numbers down instead of up, and it can cause extra space between some grid items. 

Susy by default positions items relative to the items that preceeded them. 

Container relative positioning makes more verbose output code than normal.

`isolate-grid(1,9)` This helper will tell Susy to position an item relative to the container. 

Pass it the number of columns to span and the context.

`isolate` This mixin can be used alongside `span-columns` to address discrepencies with individual grid elements. Not super effective if working with multiple grid elements.

Media Queries
-------------------------------------------------------------------------------------------
Can do them inline with existing styles using a media-query mixin. 

Doing them inline makes it easier to change a style later, especially in bigger projects. 

Declare styles that will be the same across viewports first and then make modifications for the different viewports.
```sass
.style {
  color: $color1;
  @include MQ(S) {
    width: 80%;
  }
}
```

### Compression (GZip)
The difference in size between writing media queries inline and grouping them together is negligible. 

The benifts of maintability that come from doing media-queries inline far outweights the size benefits of grouping them together.

CSS3 Mixins
-------------------------------------------------------------------------------------------
These mixins will add all the vendor prefixes for you.

### Text-shadow
```sass
@include text-shadow(h-offset v-offset blur color);
```
You can set default values with the variables: 
* `$default-text-shadow-color`
* `$default-text-shadow-blur`
* `$default-text-shadow-v-offset`
* `$default-text-shadow-h-offset`

You can add multiple shadows by comma-separating each shadow

### Border-radius
```sass
@include border-radius(radius);
```
You can set a default value with the `$default-border-radius variable`

You can also use:
* `border-top-right-radius(5px);`
* `border-bottom-right-radius(5px);`
* `border-bottom-left- radius(5px);`
* `border-top-left-radius(5px);`
* `border-top-radius(5px);`
* `border-right-radius(5px);`
* `border- bottom-radius(5px);`
* `border-left-radius(5px);`

### Multi-column
```sass
@include column-count(3);
@include column-rule(line-width, type-of-line, line-color);
```

### Box-shadow
```sass
@include box-shadow(h-offset v-offset blur spread color);
```
Spread is optional

Can add multiple box-shadows by comma separating them. 

Can also set default variables
* `$default-box-shadow-color`
* `$default-box-shadow-h-offset`
* `$default-box-shadow-v-offset`
* `$default-box-shadow-blur`
* `$default-box-shadow-spread`
* `$default-box-shadow-inset`

### Gradients
```sass
@include background(linear-gradient(to-direction, 
                                    first-color first-color-stop, 
                                    second-color second-color-stop));
@include background(radial-gradient(start-position circle-size circle-type, 
                                    first-color first-color-stop, 
                                    second-color second-color-stop));
```
The start position is the center if omitted.

#### Combining background images
Whichever item is declared first in the background syntax sits on top of the the others. 

Comma separate them.

### CSS Transform
`@include scale(2, 2);` Will change the size of an element
`@include translateX(20px);` Will move an element on the screen
`@include simple-transform(1.05, 3deg);` Performs multiple transforms on a single elements. 

Args are in this order: `scale`, `rotate`, `transform`, `translate-x`, `translate-y`, `skew-x`, `skew-y`, `origin-x`, `origin-y`.

`@include rotate(45deg);` Rotates an element.

#### Shadows around odd shapes.
Usually just a good idea to make the shape an icon-font and use text-shadow. 

However, if that’s not an option for some reason you can use Compass Filter mixins.

### CSS Filters
`@include filter(drop-shadow(#ccc 1px 1px 0px));`

### Transitions
`@include single-transition(all, .3s, ease, 0s);` Performs a CSS transition.

`@include transition()` Adds mutliple transitions on a single element, seperated by commas.

Images
-------------------------------------------------------------------------------------------
```sass
image-height(“image/path.png”);
```
Get an images height, (doesn’t work on SVG)
```sass
image-width(“image/path.png”);
```
Get an images width, (doesn’t work on SVG)

### Cache buster
Compass automatically adds a random string to the end of an image path whenever the css is modified, so that the browser fetches a new version.
```sass
background-image: image-url(“image/path.png”, false, false);
```
This code will turn off cache-busting. 
The first `false` turns off the `url()` output so only the raw image path is outputed

The second `false` turns off the cache-busting.

### Sprites
Install the `oily_png` gem to produce the sprite sheets faster. 
```sass
@import “folder /*.png”;
@include all-folder-sprites;
```
This will import all the PNG images in the folder. 

The next line gets all the images in the folder and then makes them into sprites.

Compass generates selectors based on the names of the images in the folder. The selectors set the proper `background-position` for the image.

The generated selector doesn’t include the `height` and `width` for the image, so you have to do that separately
```sass
$image-height: folder-sprite-height(image-name); 
$image-width: folder-sprite-width(image-name);
```
The sprite helper requires the name of the folder, the word `sprite`, then the dimension you want all delimited by hyphens.

#### Additional sprite config options
All these option variables should be included before the `import` directive that produces the sprite sheet.

* `$folder-sprite-dimensions: true;` Adds height and width property to each generated css selector.
* `$folder-spacing: 10px;` Adds extra spacing around each image in the sprite.
* `$folder-layout: horizontal;` Changes the layout of the images in the sprite. Can also be `vertical`, `diagonal`, `final`, and `smart`. 

Text Replacement
-------------------------------------------------------------------------------------------
`@include hide-text;` Hides the text by indenting it way off the screen.

`@include squish-text;` This will hide inline text well and keep it visible to screen readers.

`@include replace-text-with-dimensions(‘image/path.png’);` This automatially sets an elements dimensions according to the size of the image.

SVG’s
-------------------------------------------------------------------------------------------
Sprites don’t work well with responsive design or “retina” displays. SVGs do.

SVG files are smaller than bitmaps (JPG,PNG), and we can reduce the number of requests by turning SVGs into data URIs. A data URI embeds a file into the code.

`inline-image(“image/path.svg”);` Turns an SVG into a data URI.

You can fallback on non-svg devices in tandem with Modernizr by nesting this:
```sass
.no-svg & {
  background-image:image-url(“image/path.png”);
```

Math Calculations
-------------------------------------------------------------------------------------------
You can do addition and subtraction just like you’d expect.

With multiplication and division you can’t include the unit type on both numbers.

With division you have to include it in parenthesis or as part of another peice of arithmetic.

You can do calculations with variables

Control Directives
-------------------------------------------------------------------------------------------
You can use `if/else` to change your whole color scheme by just changing a few variables, and having your colors be relative to each other.

### for loop
Pick a style and stick to it

`@for $i from 1 through 4` Loop goes up to and includes the final number

`@for $i from 1 to 4` Loop goes up to, but excludes the final number

### Interpolation
Use the `#{$variableName}` syntax: `.buy_#{$i}`

You can’t dynamically create variables like this.

### each loop
```sass
@each $current-color in $colors-list
```

Stripping and Adding Units
-------------------------------------------------------------------------------------------
Multiply the variable by a unitless value to strip the unit. 

Multiply the variable by a value with a unit to add it.

Functions
-------------------------------------------------------------------------------------------
Like mixins, but used to generate a value, not css property value pairs.
```sass
@function funcName($arg1, $arg2) {
  @return something
}
```

`@debug` Can output things to the console.

`@warn` Like the @debug. 

Can suppress by adding 
```ruby
sass_options = {:quiet => true} 
```
to the `config.rb` file

Statistics
-------------------------------------------------------------------------------------------
Get compass statistics by going to the root of your project and running 
```bash
compass stats
```
To get statistics on css install the css parser gem. 

When you run `compass stats`, you will now get css stats too.
```bash
gem install css_parser
```

Clear cache
-------------------------------------------------------------------------------------------
To clear the sass cache run `compass clean`

Chrome tools
-------------------------------------------------------------------------------------------
You can enable an experimental SASS tools in Chrome.

You can see how long it takes to paint the page without a cache by enabling `Enable continuous page repainting`. 

Pages that take more than _16ms_ to paint should be investigated. 

Select suspicious elements in the `Elements` panel and press the h-key to show and hide them.

Find unused styles with the CSS Profiles feature:
1. Click the Profiles tab. 
2. Select “Collect CSS Selector Profile”
3. Press “Start”. 
4. Go through all the parts of the site, click on stuff, hover over stuff, etc. 
5. Click the red stop sign in the bottom left when you’re done. 
6. Click on the profile you just created and sort by matches ascending. 
7. Look for things with 0 matches that are associated with a stylesheet.
