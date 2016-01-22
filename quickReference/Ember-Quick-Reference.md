![Ember Logo](https://upload.wikimedia.org/wikipedia/en/6/69/Ember.js_Logo_and_Mascot.png)
Ember Quick Reference
========================================================================================

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

Debugging
-------------------------------------------------------------------------------------------
Use `Ember.Logger` methods for debugging Ember objects.
Methods include: `assert`, `debug`, `error`, `info`, `log`, `warn`

### Log Current State
To get the current route name you can use
```javascript
this.controllerFor('application').get('currentPath');