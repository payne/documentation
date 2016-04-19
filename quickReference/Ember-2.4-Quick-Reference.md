![Ember Logo](http://www.gravatar.com/avatar/0cf15665a9146ba852bf042b0652780a?s=200)
Ember 2.4 Quick Reference
========================================================================================

* [References](#references)

References
-------------------------------------------------------------------------------------------

Templates
-------------------------------------------------------------------------------------------
### if
Normal javascript things are falsey.  Empty arrays are also falsey

### each
Have to specify the model and the variable name
```handelbars
  {{#each model as |album|}}
```

### outlet
`{{outlet}}` Let's Ember know where to nest templates

### Application Template
The application template is always on the page and things change inside it depending on the route.

When the url is `/` this is the index template and index route.

### link-to
Does the opposite of a route.  A route takes a url and finds a model.  `link-to` uses a model to find a url.

Give it the route name and the model you want to use.
```handlebars
{{#link-to 'photo' model}}Grumpy{{/link-to}}
```

By default Ember replaces the segment with the object's `id` property

You specify sub-routes with dot syntax `photo.edit`

Custom Helpers
-------------------------------------------------------------------------------------------
Make it easy to turn raw data values in to friendly human readable ones

Names should be `-` delimited

Export the helper as an `Ember.Helper.helper`

You should `export` the bare-bones function that the helper uses as well as the helper itself to make unit testing easier

### Dependent Keys
Dependent Keys tell the helper which properties the helper should depend on

Pass each property to as additional arguments to the `Ember.Helper.helper` function.

### HTML Escaping
Ember escapes html by default for security reasons

Can override this by using `.htmlSafe()` on a string

Routes
-------------------------------------------------------------------------------------------
`resource` has been deprecated.  Only use `route`.

`Rouer.map` Where you define your routes

`:some_name` is a dynamic segment in the `path`.  If Ember can find a route that matches the dynamic segment will be saved as a variable in the `params` object which will be passed to the `model` hook of the route.

If the `path` name is the exact same as the `route` name, then you don't need a second argument in the `route` function.

A route handler can be made be extending `Ember.Route` not `Ember.Router`.  `Ember.Router` is only for the main router

### Nesting
When you nest routes it has everything to do with which templates and routes and not the api server calls

You don't have to include the parent path name in the name of the child path.  It's done automatically

Nested routes inherit their parents model by default

An `index` route is automatically generated for each nested route.

Nested routes reset the namespace of the route heirarchy

Enumberables (Arrays)
-------------------------------------------------------------------------------------------
`findBy` will return only one item from an array that maches the condition

Ember Objects
-------------------------------------------------------------------------------------------
All things in Ember inherit from this.

Extend normal javascript objects

`extend` lets you make sub-classes of this

### Why not just native javascript objects
Changes in how a property is implemented can easily leak into other parts of the app and it means there is poor encapsulation

### Computer Properties
Uses an observer pattern to always keep the view up to date

For a properties value do this:
```javascript
isReadyForWork: Ember.computed('assignee', 'description', function() {
  return this.get('assignee') && this.get('description');
});
```

You can also use paths in arguments `assignee.length`

Computed properties know how many times to recalculate.  Caches things, so it doesn't recalculate unless properties change.

You can make computed properties out of computed properties

`@each` does the following:
* Recompute if an item is added
* Recompute if an item is removed
* Recompute if changes

#### Computed Macros
Pull in `Ember.computed`

Components
-------------------------------------------------------------------------------------------
Don't have to have javascript file and template, can just have one of them

Can pass in attributes that the component template will render

### Block components
Can use components in block form to wrap provided content.  Use `{{yield}}` inside the component template to render the provided content.

The template inside the component block will have access to the context outside of it

### Positional Params
Instead of passing things into the component like `title=post.title body=post.body` you can set a `positionalParams` attribute in your component which is an array that says the order of params to come in.  Then you can just do `{{blog-post post.title post.body}}`

You need to define the component first and then do `reopenClass` and add the `positionalParams` to it, because `positionalParams` needs to be `static`

### Wrapper <div>
Can use the `tagName` property in a component to change the wrapper `<div>` that Ember automatically adds to components.

Can also use `classNames` to add class names.

Can link classNames to a component property with `classNameBindings`

If you use a  `boolean` in `classNameBindings` the class will only be added when the `boolean` is `true`.  Ember will automatically make the propety name lowercased and hyphenated.  You can override the class for `true` and class for `false` with this syntax: `isExpanded:expanded:collapsed`.  You can leave off either the `expanded` or `collapsed`.

### Rendering
Ember calls `didInsertElement` on the component when Ember has rendered it in the DOM

You can use `this.get('element')` inside the component to get it's element

You can render dynamically pick which component to render using the `{{component 'blog-post'}}` syntax

Run Loop
-------------------------------------------------------------------------------------------
Manages when things fire to get best performance

Wrap async operations from 3rd-party apis in Run loop functions

`run.debounce` will call a function after a certain amount of time as long as the function isn't invoked again.

Services
-------------------------------------------------------------------------------------------
Singleton objects that hold onto global state.

You define one with `Ember.Service.extend`

Only instantiated once.

Can be injected into objects like this
```javascript
friendActivity: Ember.inject.service('friend-activity');
```

If property name matches service name, you don't need to include the first argument (e.g `friend-actity`);

Can pass in the `Ember.Evented` mixin to trigger events
```javascript
Ember.Service.extend(Ember.Evented, {});
```

Ember Data
-------------------------------------------------------------------------------------------
Can support nested json structure, but it's better to do side-loading to elminate duplicates

### Adapters (Deserializers)
You specify these in the adapters folder

Tell Ember how to make requests to the server

#### Rest Adapter
There's a RESTAdapter that comes with ember data `DS.RESTAdapter`

### Serializers
Tell Ember how to serialize turn server responses into models

There's a RESTSerializer that comes with ember data `DS.RESTSerializer`

### Data Models
Backed by persistant state

All data models should have a unique id

Don't need to declare an id attribute in the model

Use `DS.attr` to declare data from the server as a property in the model

You can pass a hash of options to the `DS.attr` including `defaultValue`

#### Relationships
Can use `hasMany` to establish a relationship

Can use `belongsTo` on the opposite side of a `hasMany`

#### Transforms (Data Types)
You can attempt to coerce data from the server into a data type by passing in the type to `DS.attr`

You can use `string`, `number`, `boolean`, and `date`

You can create your own transform types as well

### Store
Is a CRUD liazon

Caches and avoids redundant requests

`this.store.find` Inside a route will do a `GET` request to pull down the model and any models it has a relationship with

You can pass can add query parameters to `.find` by passing in an object as the second parameter

Ember Functions
-------------------------------------------------------------------------------------------
`isPresent` Checks if an object is blank (empty or whitespace).  

Ember CLI

Has built in Express server

Testing
-------------------------------------------------------------------------------------------
Can use `store.pushPayload(payload)` to simulate data coming from the server to the store

Ember comes with `Qunit`

Unit tests - best for testing function or simple object with clear set of inputs and outputs.

### Testing Models
`moduleForModel` - lets you get a model from the store.  First arg is the model, second arg is the name of the module.

Can specify a 3rd argmuent that's an object and give it a `needs` property to bring in the dependencies of the model

```javascript

moduleForModel('player', 'Unit | Model | player', {
  needs: ['model:song']
});
```

You can then access the model inside the test with `this.subject()`

Will need to user Ember.run for asynchronous code

