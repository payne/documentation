Yeoman Ember Demo
==================
Following instructions from https://www.openshift.com/blogs/day-24-yeoman-ember-the-missing-tutorial
  **Note:** The guy who did this tutorial doesn't care about end users and as a result has lots of mistakes in his tutorial, so tread carefully

1. Do all the things in https://github.com/brandyn1bennett/documentation/blob/master/ubuntu64Config/installYeomanEmberGenerator.md

2. Make a demo directory in ~/Documents
  
  ```bash
  cd ~/Documents/
  mkdir demo
  ```

3. make a getbookmarks directory

  ```bash
  cd ~/Documents/demo
  mkdir getbookmarks
  cd getbookmarks
  ```

4. Run yo ember command and say yes to twitter freaking bootstrap

  ```bash
  yo ember
  ```

5. Run 
  
  ```bash
  grunt serve
  ```
  * View the beautiful webpage that displays in localhost:9000

6. Make a story model

  ```bash
  yo ember:model Story
  ```
  **Note:** When it asks to overwrite say yes

7. Update story_model.js with:
  
  ```javascript
    Getbookmarks.Story = DS.Model.extend({
    url : DS.attr('string'),
      tags : DS.attr('string'),
      fullname : DS.attr('string'),
      title : DS.attr('string'),
      excerpt : DS.attr('string'),
      submittedOn : DS.attr('date')
  });
  ```

8. Restart the grunt server

9. Use bower to install ember local storage adapter

  ```bash
  bower install --save ember-localstorage-adapter
  ```
  **Note:** The *--save* means to add the dependency in the bower.json dependencies

10. Add the following to index.html after 
  
  ```html
  <script src="@@ember_data"></script>
  ```
  
  ```html
  <script src="bower_components/ember-localstorage-adapter/localstorage_adapter.js"></script>
  ```

11. Add this to app/scripts/store.js

  ```javascript
  Getbookmarks.Store = DS.Store.extend();
  Getbookmarks.ApplicationAdapter = DS.LSAdapter.extend({
    namespace: 'stories'
  });
  ```

12. Replace router.js with
  ```javascript
    Getbookmarks.Router.map(function () {
   
    this.resource('index',{path : '/'});
    this.resource('story', { path: '/story/:story_id' });
    this.resource('story_edit', { path: '/story/new' });
  });
  ```

13. Create a new file called story_edit.hbs in app/templates/ and copy this code into into it

  ```handlebars
   <form class="form-horizontal" role="form">
      <div class="form-group">
        <label for="title" class="col-sm-2 control-label">Title</label>
        <div class="col-sm-10">
          <input type="title" class="form-control" id="title" name="title" placeholder="Title of the link" required>
        </div>
      </div>
      <div class="form-group">
        <label for="excerpt" class="col-sm-2 control-label">Excerpt</label>
        <div class="col-sm-10">
          <textarea class="form-control" id="excerpt" name="excerpt" placeholder="Short description of the link" required></textarea>
        </div>
      </div>
 
      <div class="form-group">
        <label for="url" class="col-sm-2 control-label">Url</label>
        <div class="col-sm-10">
          <input type="url" class="form-control" id="url" name="url" placeholder="Url of the link" required>
        </div>
      </div>
      <div class="form-group">
        <label for="tags" class="col-sm-2 control-label">Tags</label>
        <div class="col-sm-10">
          <textarea id="tags" class="form-control" name="tags" placeholder="Comma seperated list of tags" rows="3" required></textarea>
        </div>
      </div>
      <div class="form-group">
        <label for="fullname" class="col-sm-2 control-label">Full Name</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter your Full Name like Shekhar Gulati" required>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-success" {{action 'save'}}>Submit Story</button>
        </div>
      </div>
  </form>
  ```

14. Replace code in controllers/story_edit_controller.js with:

  ```javascript
    Getbookmarks.StoryEditController = Ember.ObjectController.extend({
   
    save: function(){
      var url = $('#url').val();
          var tags = $('#tags').val();
          var fullname = $('#fullname').val();
          var title = $('#title').val();
          var excerpt = $('#excerpt').val();
          var submittedOn = new Date();
          var store = this.get('store');
          console.log('Store .. '+store);
          var story = store.createRecord('story',{
              url : url,
              tags : tags,
              fullname : fullname,
              title : title,
              excerpt : excerpt,
              submittedOn : submittedOn
          });
      story.save();
      this.transitionToRoute('index');
    }
  });
  ```

15. Replace the code in routes/application_route.js with
  ```javascript
    Getbookmarks.ApplicationRoute = Ember.Route.extend({
      model : function(){
          var stories = this.get('store').findAll('story');
          return stories;
      }
  });
  ```

16. Replace the code in templates/application.hbs with

  ```handlebars
    <div>
      <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">GetBookmarks</a>
          </div>
          <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav pull-right">
                  <li>{{#link-to 'story_edit'}}<span class="glyphicon glyphicon-plus"></span> Submit Story{{/link-to}}</li>
              </ul>
          </div>
      </nav>
      <div class="container" id="main">
          <div class="row">
              <div>
                  <div class="col-md-3">
                      <div class="well sidebar-nav">
   
                          <table class='table'>
                            <thead>
                              <tr><th>Recent Stories</th></tr>
                            </thead>
                            {{#each controller}}
                              <tr><td>
                              {{#link-to 'story' this}}
                                {{title}}
                              {{/link-to}}
                              </td></tr>
   
                            {{/each}}
                          </table>
                      </div>
                  </div>
                  <div class="col-md-9">
                      {{outlet}}
                  </div>
              </div>
          </div>
      </div>
  </div>
  ```

17. Update story_route.js with
  ```javascript
  Getbookmarks.StoryRoute = Ember.Route.extend({
    model : function(params){
          var store = this.get('store');
          return store.find('story',params.story_id);
    }
  });
  ```

18. Update app/templates/story.hbs with

  ```handlebars
    <h1>{{title}}</h1>
  <h2> by {{fullname}} <small class="muted">{{submittedOn}}</small></h2>
  {{#each tagnames}}
    <span class="label label-primary">{{this}}</span>
  {{/each}}
  <hr>
  <p class="lead">
        {{excerpt}}
  </p>
  ```

