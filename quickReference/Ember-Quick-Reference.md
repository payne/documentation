![Ember Logo](http://www.gravatar.com/avatar/0cf15665a9146ba852bf042b0652780a?s=200)
Ember Quick Reference
========================================================================================

[create an anchor](#References)
[create an anchor](#App)

References
-------------------------------------------------------------------------------------------
*Building Web Apps with Ember.js* - Jesse Cravens & Thomas Brady
*Mastering Ember.js* - Mitchel Kelonye

App
-------------------------------------------------------------------------------------------
```javascript
var App = Ember.Application.create();
```

### App Configuration/Configuration Flags
You can pass these flags into the create object
* Have Ember log each route transition: `LOG_TRANSITIONS: true`
* Have Ember log things that it is generating: `LOG_ACTIVE_GENERATION: true`
* Get more detailed trannsition info: `LOG_TRANSITIONS_INTERNAL: true`
* Log bindings as they occur: `LOG_BINDINGS: true`
* Have Ember log view events on route transitions: `LOG_VIEW_LOOKUPS`

### Debugging
Use `Ember.Logger` methods for debugging Ember objects.
Methods include: `assert`, `debug`, `error`, `info`, `log`, `warn`

#### Log Current State
To get the current route name you can use
```javascript
this.controllerFor('application').get('currentPath');
```

#### Log Events
You could make a trace function that posts a timestamp to the server of how long events take to happen.

#### Log Errors
You could use the `Ember.onerror` method to post errors to a server.

Testing
-------------------------------------------------------------------------------------------
There is an Ember mocha adapter you can use.
Make sure the root element of the app has unique id and that it is set in the app.
```javascript 
App.rootElement = '#ember'
```

Run the setupForTesting method
```javascript
App.setupForTesting();
```

Add the Ember test helpers into the test environment. 
```javascript
App.injectTestHelpers();
```

#### Before/After Each
In the before hook you can use the visit helper to go to a certain route.
```javascript
App.beforeEach = function() {
  visit('/');
}
```

In the post-test hook you can reset the app and destroy the data
store with the reset helper.
```javascript
App.afterEach = function() {
  App.reset();
};
```

#### Async Helpers
If used, the next bunch of tests need to be wrapped in a run loop function.
```javascript 
visit(url)
```
Goes to the provided url route.

```javascript
fillIn(selector, text)
```
Sets the value of an input with the given text.

```javascript
click(selector)
```
Triggers a click event

```javascript
keyEvent(selector, type, keyCode)
```
Triggers a key event on the given selector

```javascript
triggerEvent(selector, type, options)
```
Triggers other DOM events.

#### Synchronous Helpers
```javascript
find(selector, context)
```
Performs an element selection within the given optional context.

```javascript
currentPath()
```
Get's the application's route pathj

```javascript
currentRouteName()
currentURL()
```

#### Wait helpers
```javascript
andThen
```
Runs a block of test operations after the previous async ops have finished.

#### Unit Tests
Unit tests are for testing object-computed properties, observers, and method calls.

##### Testing computed properties
Set values on the dependent properties of an object and then see if the computed property equals what you'd expect.

#### Integration Tests
Look at *Mastering Ember.js Chapter 10*

Routes
-------------------------------------------------------------------------------------------
Routes store the logic to get your app to and from the state represented by the URL.
You have to use a `#` in your route URLs: `http://localhost:8000/#/`
Each route will have a controller and template with the same name as the route.

### Changing the root url
If the application isn't served at the root then you can change the rootUrl like so
```javascript
App.Router.reopen({
  rootURL: '/contacts/'
});
```

### Changing browser location subscription method
```javascript
App.Router.reopen({
  location: 'history'
});
```
Or you can set location to `'auto'`, or `'none'`

### Map Routes
```javascript
App.Router.map(function() {
  this.route('route-name');
  this.route('search-results',{
    path: 'search/:term'
  });
  this.resource('contact',
    {path: '/:contact_id'},
    function(){
      this.route('edit');
    });
});
```
Resources allow you to make sub-routes.
If the route name and what appears in the url are different than you can add an object to the route function with the path name.
You can add a dynamic segment to a route by adding something like `:term` to your path.

### Route Handlers
```javascript
App.IndexRoute = Ember.Route.extend({
  model: function(params) {
    return ['red', 'yellow', params.color];
  } 
});
```
Ember automatically calls the model method on a route when the route is loaded and passes in dynamic segments from the URL as an object.
The model method needs to return an Ember model.
The model method can return a promise and the router will automatically be notified when the promise resolved.
When the model is resolved Ember will automatically set the model on the corresponding controller using the setupController method.

#### Serialization
You can override how a route serializes url data

```javascript
App.ContactRoute = Ember.Route.extend({
  serialize: function(model, params) {
    var data = {};
    data[params[0]] = Ember.get(model, 'id');
    return data;  
  } 
});
```
The model argument is the affected resource, and the params argument is an array of all the segments in the resource definition.

#### setupController
`setupController` is called after the controller is instantiated and the model method has returned content to the controller. 
`setupController` is passed a reference to both the controller and the model method content.
Can use this method to set properties on other controllers using: `controllerFor('controllerName')`or `modelFor('modelName')`

### Custom Template Rendering
Route (not resource) handlers usually handle the final template 
Specify a custom template to use with `renderTemplate` method. 
```javascript
App.ContactEditRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('contacts/form');
    this.render('mainboard', {
      into: 'game',
      outlet: 'mainboard',
      controller: 'mainboard'  
    });
  }
});
```
You can also render different templates into different outlets.

### Asynchronous Routing
We can have the route handler's model function return a promise that will make the route load the model once the XHR request is complete.

### Redirect
You can override the redirect hook in a `handlerto` transition to another state. Use the `transitionTo` function here.

### Catching routing errors
Handle routing errors in the action method of a route handler.
```javascript
App.ContactsRoute = Ember.Route.extend({
  action: {
    error: function(error){
      this.controllerFor('error')
          .set('error',error);
      this.transitionTo('error');
    }
  } 
});
```

### Debugging
You can lookup any instantiated router like this:
```javascript
App.__container__.lookup(“route:index”); 
```

Controllers
-------------------------------------------------------------------------------------------
Controllers are the conduit through which data flows into templates.
In a template, Ember will first check if the controller defines a variable, if it doesn't it will proxy the request to the model.
If the model on a route is an array, Ember will instantiate an ArrayController if another controller type isn't specified. An ObjectController is used to represent a single model
Define
App.IndexController = Ember.Controller. extend({});
You can create controllers from other controllers. App.TweetsController = App.IndexController. extend();
You can create one with a mixin.
var ctrl = Ember.Controller.
createWithMixins(mixin);
Object Controller
Data being represented is set as the model property for the controller.
The properties of the controller get translated as the properties of the model. This doesn't happen with normal controllers.
This kind is useful when we need computed properties on the controller that are dependent on the model's properties. It makes it so don't have to prefix template variables with model.
Array Controller
If the model of the controller is enumerable data like an array then we can use this kind of controller and won't have to prefix template variables with model.
addObject(object)
Will add an object to the end of the controller model if the object isn't already there.
pushObject(object)
Always adds the object even if it's already there.
removeObject(object)
Remove an object from the array. Will fail silently if the object isn't in the array.
You can use multiple params in the 3 methods listed above.
contains(object)
Returns a boolean if the array contains the object
compact()
Returns a copy of the underlying model, removing undefined and null items.
every(callback)
Checks if each item in the array meets a given condition.
filter(object)
Works the same as the native JavaScript function.
filterBy(property)
Compacts the array with items that contain a given property.
find(callback)
Like filter, but once it finds a match it quits.
findBy(key, value)
Like find() but more specific insertAt(index,object), objectAt(index),
removeAt(index,length)
Does things at given indicies. Can't lookup by negative index.
map(callback)
Same as native JavaScript function.
mapBy(property)
Creats an array based on the property given.
forEach(function)
Invokes a given funciton on each item.
uniq()
Returns a new array devoid of duplicates
sortProperties and sortAscending
These are properties you can set on the controller. Provide
an array of properties to sort by in the sortProperties property. Choose to sort ascending/descending by setting the sortAscending property to true/false respectively.
Needs
You can specify controllers that your controller depends on, by using the needs property. Controllers can depend on each other and not be caught in an infinite loop.
Action Handlers
Add a property to the controller named actions that is an object with event handler functions:
actions: {
  funcName: function(modelData) {
    console.log(modelData.prop);
  }
}
Properties
Bound templates can reference the properties of the controller.
Computed Properties
Make a properties value a function to make it a computed property and add a property function to specify other properties to observe that will trigger a change.
applicationName: function() {
  var st = this.get('searchTerms');
return st;
}.property('searchTerms'),
Instance of objects should never be set on a class definition unless they're meant to be static.
Controllers can reference other controllers.
Observables
A function that fires when an observed property changes.
queryTermDidChange: function() {
  //...
}.observes('queryTerm'); Debouncing
Ember provides a debounce method that takes a context, a function to fire, and the time to wait for invocation if no other calls are made.
Ember.run.debounce(this, this.searchResults, 100);
Get/Set
Use .get() and .set() all the time, because they trigger
change and listening events that may be needed by other properties.
Transitioning Between Routes
You can transition to new routes in a controller with the transitionToRoute function. The second parameter will get added to the url as a dynamic segment, if it's a string.: this.transitionToRoute('route', data);
Debugging
You can lookup any controller globally. It should only be done for debugging purposes. App.__container__.lookup(“controller:index”);
Templates
Move your stuff to .hbs files for cleaner code.
Use the {{}} syntax to reference dynamic elements.
Two-way binding is applied automatically, so any updates to the variable will be reflected in the template.
Link-to
You can link to another route like this:
{{#linkTo “route-name” attr1=””}}Text{{/linkTo}}
Input
{{input type=”text” placeholder=”” valueBinding=”controller.searchTerms” action=”submit”}}
The valueBinding property will bind the value of the input to a variable. It will be bound by default to the model if another namespace isn't specified.
Adding an action helper to the input will link it to the submit event that forms fire.
Checkbox
{{view Ember.Checkbox checkedBinding=”artistsIsChecked”}}
The checked value will be bound to whatever is passed to teh checkedBinding attribute.
Outlet
Tells Ember where to render the template for the current route:
{{outlet}}
You can render different templates with different controller contexts in the same template.
{{outlet leaderboard}}
{{outlet mainboard}}
A parent template can specify named outlets into which child templates can be rendered
Each
Iterate over an array of objects.
{{#each index in App.someArr}}
  <li><a href=”#”>{{index.name}}</a></li>
{{/each}}
Can throw an else statment in there to catch cases where the iteration data is empty.
If/Else
{{#if nickname}}
  <li><a href=”#”>{{nickname}}</a></li>
{{else}}
  <li><a href=”#”>{{name}}</a></li>
{{/if}}
If the value is false, null, undefined, '', 0, NaN, or the array is empty the condition will evalute to false.
You can also use an unless condition that will only be met when the variable evaluated is falsy.
You can't use logic in the conditions, but you can use them in computed properties in the controller.
Action
<a{{action 'funcName' param1}}>text</a>
The action can capture a click event and call a handler function on the template's controller. It can pass parameters to the handler. You can specify which kind of event with the on handler.
An actions handler can be defined in the route or the controller. The action's function is first looked up in the corresponding controller, and then the corresponding router. In the route handler layer Ember will look up the function name in the parent route handlers. If an action handler returns true Ember will keep looking for the handler.
You can also specify the controller that holds the action function by using the target attribute
Bind-attr
{{bind-attr href=”model.biography.url”}}
If the bound attribute is a boolean, the attribute will exist or not exist based on the value of the boolean.
Binding Class Names
Works the same way as bind-attr with some additional things. You can toggle a class name based on a controller's property.
<a href='/'{{bind-attr class =' selected:active:inactive'}}>Click me</a>
If the class name will be active/inactive based on whether the selected property is true/false respectively.
If only one argument is passed after the colon, the arg willl be used as the class name.
<a href='/'{{bind-attr class=' isSelected:selected'}}>Click me</a>
If the isSelected property is true, then selected will be used as the class name.
CamelCase names will get dehasherized into names with hypens. You can add multiple classes with the same signature seperated by spaces.
You can include an unbound class name by having it start with a colon :active
You can't have both a class attribute and classes established in a bind-attr helper
Custom Helpers
You can add a custom helpers to your App like this:
Ember.Handlebars.helper('helper-name',
  function(value, options) {
    var h = parseFloat(value);
    var html = “<h4>Hotness: “ + h;
    return new Handlebars.SafeString(html);
});
You can call the helper in your template and pass in values:
{{helper-name value}} Subexpressions
{{outer-helper (inner-helper 'arg1') 'arg2'}}
Unbound Expressions
If you don't want the template to reflect changes in the controller or model, then use 3 curly braces.
{{{post}}}
Comments
{{! some comment }}
These aren't rendered to HTML comments.
Switching Contexts
If you want to specify which context to prioritize during a check use:
{{#with controller.controllers.contact as contact}}...{{/with}}
Partials
Inserts a template where the partial expression is identified
{{partial “contacts/form”}}
You don't lose context when you use the handler.
You can also use the render helper which works like the partial helper, but can take an optional context as the second argument.
Debugging
You can access any template like this:
Ember.TEMPLATES['index']
You can debug the template by dropping in a {{debugger}} You can log within templates like this {{log model}}
Views
Good to use when a section of the app requires sophisticated event management, there's a need for reusable components, the app needs to integrate 3rd party libs.
Views are usually backed by an instance of the corresponding controller. You can access the controller with view. getController()
Every view renders a template into the DOM. You define one like this:
App.SongView = Em.View.extend({
  didInsertElement: function(){},
  click: function(jQueryEvent){},
  eventManager: Ember.Object.create({
  })click: function(jQueryEvent, view){}
});
Ember automatically cleans up unused variables and bindings as
views are hidden and shown.
Specify template
You can specify a template to override the Ember convention with the templateName property.
Element tag
Views are all wrapped in an div tag by default. You can change this with the tagName property.
Element tag class attribute
You can specify the class names that should go in the wrapper element with the classNames property.
You can use the classNameBindings property to add class names dynamically based on the boolean value of a property in the view.
Other attribute of element tag
Add the attributes you want in the tag to the attributeBindings property. Make the values for the attributes normal properties of the view class.
The attributes values or existence can be computed with computed properties.
Inserting in the DOM
If you need to manuall insert use the view. appendTo('selector') or view.append() to add to the body, or view.remove(), or you can use view.destory() which will destroy the view and automatically remove it from the DOM
Inserting views into templates
Use the view helper.
{{view App.HeaderView}}
You can also do them as block statements for further nesting
{{#view App.ContentView}}
  {{view.App.SideView}}
  {{view.App.PaneView}}
{{/view}}
You an manually manage child views with a containerView var contentView = Ember.ContainerView.create(); contentView.pushObjects([
  sideView, paneView
]);
You can also use this childViews property to do this. Container views cannot have templates or layouts.
You can access a child's view parent view with the parentView property.
Layouts
A template is marked as a layout by adding the {{yield}} expression in it. This tells Ember where to insert the template, much like the {{outlet}}
Specify the layout for the view with the layoutName property in the view's class definition
Html elments with self-closing layouts, can't be views
Registering event handlers
You can have a view send event messages.
click: function(event){
} this.get('controller').send('checkout');
A view only manages events invoked in their templates. Child views bubble events up to parent views usually.
A view can send user-initiated events with the send method You can add click listeners.
You can add an eventManager which helps when there are nested views.
Built-in views
Textfields
We can subscribe to change events with the change event handler.
App.InputView=Ember.TextField.extend({
  change: function(event){
    console.log(this.get('value'));
  }
});
{{view App.InputView name=”name”
valueBinding=”controller.name”}}
Textarea
Like textfield, but with more properties such as rows, and cols.
Select Menu
Can select which content to bind to with the contentBinding attribute.
App.AppCtrl = Ember.Controller.extend({
  selectedFruit: null,
  fruits: [{id:1, name:'mango'},
});       {id:2, name:'apple'}]
{{view Ember.Select
  prompt=”Select a Fruit”,
  contentBinding=”fruits”,
  selectionBinding=”selectedFruit”,
  optionLabelPath=”content.name”,
  optionValuePath=”content.id”}}
The selection property holds the selected choice.
When the items in the array are objects you can use the optionLabelPath and the optionValuePath to indicate what should be the label and what should be the value
Checkboxes
{{view Ember.Checkbox name=”is-complete” value-
binding=”isComplete”}}
3rd-party DOM manipulation libs
Use the didInsertElement to make sure that the view has been inserted into the DOM. Make sure you call the _super method to not lose parent functionality. Use the schedule method to run the code after the view's been rendered. Ember.run.schedule('afterRender', this, function Calling this.$() returns a jQuery element selector relative to the view.
Use willDestroy to tear down events a plugin has setup, before you remove the view.
Debugging
Instantiated views have unique ids. You can look them up by their id.
Ember.views['ember1']
Components
The controller context of a component is isolated from the rest of the application, unlike views which are accessible to different controllers.
Define:
In app/scripts/components
App.ActivityLogComponent =
  Ember.Component.extend({});
In templates/components create an hbs file with the dashed name of the component. Custom elements must be namespaced with a hyphen.
<p>display_id: {{display-id}}</p>
<p>type: {{type}}</p>
Use:
In a template file include the component as a directive. You can pass in data to the component handlebars template. You can access passed in data as properties of the component. {{activity-log display_id=display_id type=type}}
Change Component's tag
You can change the component's tag with the tagName property Changing class name
The component class attribute can be manipulated in the same way it can in a view
Actions
Components can have their own actions, because they act as controllers that are isolated from the rest of the app.
Interfacing with rest of the app
A component can send action events to its parent controller with the sendAction function. The first argument of sendAction is always 'action' and the next param is the object(s) we wish to send along. Make the action attribute of the component have the handler name that's inside the parent controller.
As Layouts
Not defined in the view layer. Additional content can be inserted without losing scope. Uses the {{yield}} expression.
Models
Models mainly exist for the sake of persistence. You instantiate one like this:
var artist = App.Artist.create({
  id: 'ADSF31431',
  name: 'Tom Waits'
});
Object Class
Good for holding transient data and being a “proto-model”. You define one like this:
App.Artist = Em.Object.extend({
id: null,
  name: null
});
The values you set in the definition, will be the default values.
Extending
If you need to add new properties and methods to a class after defining it. You can use Ember.Object.reopenClass()
Promises
Ember includes a promise library called RSVP.
Promise.all([
  functionOnWhichWeDepend(),
  anotherFunctionOnWhichWeDepend(),
  yetAnotherFunctionOnWhichWeDepend()])
  .then(function() {
    console.log(“They're all finished”)
  }, function() {
    console.error(“One or more FAILED!”)
});
jQuery can be referenced as Ember.$
Can use jQuery promises, Ember.Deferred, or Ember.RSVP
Ember Data
Data Store
A DS.Store is created with the application and can be accessed by controllers and routes using this.store
find():
store.find('my-model', 1); filter():
store.filter('activity', function(activity){
  return activity.get('type', 'song');
});
all():
store.all('activity');
Is an alternative to find, when you don't want to make a network request.
getById():
store.getById('activity'); Doesn't make a network request.
Create a new record:
var record = this.store.createRecord('my-model',
{
  display_id: model.enid,
  hotttnesss: model.hotttnesss,
  timestamp: date
});
record.save();
Delete a record:
var record = store.find('record',1); record.deleteRecord();
record.save();
You can also use destroyRecord() which combines the save and delete function calls.
Define a model
App.MyModel = DS.Model.extend({
  display_id: DS.attr('string'),
  hotttnesss: DS.attr('number', {
    defaultValue: 1
  }),
  timestamp: DS.attr()
});
DS.attr takes 2 arguments a type and an options object. Attributes are usually either string, number, date, or boolean.
Relations
one-to-one
Use belongsTo to establish this kind of relationship. The thing it belongs to will be another model.
App.User = DS.Model.extend({
  profile: DS.belongsTo('profile');
});
App.Profile = DS.Model.extend({
  user: DS.belongsTo('user');
});
one-to-many
Use belongsTo and hasMany App.Post = DS.Model.extend({
  comments: DS.hasMany('comment');
});
App.Comment = DS.Model.extend({
  post: DS.belongsTo('post');
});
many-to-many
Use hasMany on both models.
Explicit Inverses
If you have multiple belongsTo/hasManys for the same type you can specify which property on the related model is the inverse with the hasMany's inverse option.
App.Comment = DS.Model.extend({
  onePost: DS.belongsTo('post'),
  twoPost: DS.belongsTo('post')
});
App.Post = DS.Model.extend({
  comments: DS.hasMany('comment', {
    inverse: 'redPost'
  })
});
Reflexive Relationships
Have to explicitly define the other side or if you don't need the other, set the inverse to null.
App.Folder = DS.Model.extend({
 children:hasMany('folder',{inverse: 'parent'}),
 parent:belongsTo('folder',{inverse:
'children'})
});
Adapters
Adapters need to sit at the network layer and make the API calls. Ember comes with a fixture adapter and a rest adapter.
FixtureAdapater
You can add some dummy data to the store by adding to the built in FIXTURES array for a model:
App.MyModel.FIXTURES = [{
  id: 0,
  display_id: “Activity1”,
  hotttnesss: 54,
  timestamp: “Fri Dec 06 2013”
}, {
id: 1,
  display_id: “Activity2”,
  hotttnesss: 99,
  timestamp: “Fri Dec 06 2013”
}];
LocalStorageAdapater
3rd-party adapater by Ryan Florence. Lets you communicate with local storage.
Rest Adapter
Ember-data expects that a property that is a has many will be the pluralized form of the model.
Ember only sends the ids of related objects. The corresponding objects will be side-loaded into the data store though.
If we need to use different API endpoints for different models we can extend the RESTAdapter and change it's host property.
Serializer
This can be used to manipulate the data as it passed back and forth from the external data source. App.ApplicationSerializer =
  DS.RESTSerializer.extend({
    // ...
});
You can make them on a per model basis as well.
App.MyModelSerializer =
  DS.RESTSerializer.extend({
// ... });
If the primary key isn't id, you can change the primaryKey property of a serializer.
Transformations
Transformations are the different kinds of model attributes. We can make new ones if we need to, like if a server api represents booleans as 1s and 0s.
App.BinaryBool = DS.Transform.extend({
  serialize: function(bool){
    return (!bool) ? 0 : 1;
  },
  deserialize: function(binary){
    return (!!!binary) ? false : true;
  }
});
Ember.Application.initializer({
  name: “myInitializer”,
  initialize: function(container,application) {}
});
Workflow Tools
Ember CLI
Uses Broccoli as an asset pipeline instead of Grunt's watch task. This makes it rebuild individual files instead of the entire project for faster build times.
Uses the ES6 Module Transpiler.
Ember Inspector
Get the Ember inspector plugin for Chrome/Firefox. Make sure “Experimental Extension APIs is enabled in chrome://flags. You can inspect all your routes and their properties in the Routes tab.
You can inspect the View Tree tab to see an overlay of the current “state” of the rendered application.
You can inspect the Data tab to see a snapshot of all the records in Ember Data.
You can log out your app's objects to the console with the $E variable.
Real-time Apps
Use Socket.io
Server-sent events are a good option if the client app is meant to constantly receive updates from the backend.
In the backend use node with Express.io which blends Express framework with Socket.io
Initialize the client library with the connect method on the exposed io global variable.
App.io = io.connect();
Then in a property in our model defintion we can use the new type.
App.Todo = DS.Todo.extend({
  complete: DS.attr('binaryBoolean');
});
Active Generation
When you start an Ember application Ember searches for ApplicationRoute, ApplicationController, and an application template. If it doesn't find them it will create them.
Lifecycle
app.js instantiates the Application
The Application looks for an ApplicationRoute or creates one
The Application looks for an ApplicationController or creates one
Any event hooks defined in the ApplicationRoute are fired
The Application looks for an application template and sets it up with the ApplicationController as its controller.
If you are at the route URL, the Application will find/instantiate an IndexRoute.
Ember will call the model function of IndexRoute passing it the last portion of your URL.
The Application will then find/instantiate an IndexController.
Ember will find the template named index and render it to the outlet helper in the application template.
Application Initializer
Does things when the app initializes.
=======
this.controllerFor('application').get('currentPath');
