Ember Starter Notes
===================

1. Follow instructions on http://emberjs.com/guides/ 
  * Download starter kit from http://emberjs.com and extract it
  * Completed source code can be found at https://github.com/tildeio/bloggr-client
  * Get the ember web inspector for Chrome from https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi?hl=en 

2. Other dependencies
  * In index.html add bootrap
   
    ```html
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css">
    ```
  * Get showdown.js (converts markdown to html)
    - CDN: "http://cdnjs.cloudflare.com/ajax/libs/showdown/0.3.1/showdown.min.js"
  * get moment.js (date formatter)
    - CDN: "http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.7.0/moment.min.js"

3. Delete stuff
  * Delete everything out of App.js except for the top line
  * Delete all of the handlebars template stuff except for the first set of opening and closing script tags in handlebars
  * Add the following to the first set of handlebars script tags:
  
  ```html
    <div class="navbar">
      <div class="navbar-inner">
        <a class="brand" href="#">Bloggr</a>
        <ul class="nav">
          <li><a href="#">Posts</a></li>
          <li><a>About</a></li>
        </ul>
      </div>
    </div>
  ```

  4. Add route for about page
    
    ```javascript
    App.router.map(function() {
      this.resource("about");
    });
    ```

5. Add about content to index.html
  
  ```html
  <script type="text/x-handlebars" id="about">
    <div class='about'>
      <p>Yehuda Katz is a member of the <a href="http://emberjs.com">Ember.js</a>, <a href="http://rubyonrails.org">Ruby on Rails</a>
      and <a href="http://www.jquery.com">jQuery</a> Core Teams; he spends his daytime hours at the startup he founded,
      <a href="http://www.tilde.io">Tilde Inc.</a>.</p>
      <p>Yehuda is co-author of best-selling <a href="http://affiliate.manning.com/idevaffiliate.php?id=485_176">jQuery in Action</a> and
      <a href="http://affiliate.manning.com/idevaffiliate.php?id=485_145">Rails 3 in Action</a>.</p>
      <p>He spends most of his time hacking on open source—his main projects, along with others, like <a href="https://github.com/wycats/thor">Thor</a>,
      <a href="http://www.handlebarsjs.com">Handlebars</a> and <a href="https://github.com/carlhuda/janus">Janus</a>—or traveling the world doing evangelism work.</p>
      <p>He can be found on Twitter as <a href="http://www.twitter.com/wycats">@wycats</a>.</p>
    </div>

    <div class='about'>
      <p>My name is Tom Dale. I helped create <a href="http://www.emberjs.com/">Ember.js</a>, a JavaScript framework that brings sanity to the web.</p>

      <p>In October of 2011, I co-founded <a href="http://www.tilde.io">Tilde</a> with Yehuda Katz, Leah Silber and Carl Lerche.</p>

      <p>In my spare time I run a cash-for-beer exchange program at many local San Francisco dive bars.</p>
    </div>
  </script>
  ```
6. Create an outlet for the about template
  * defines where the template gets rendered when the url changes
  * put the following as the last line in the first script tag:
  
  ```handlebars
  {{outlet}}
  ```

7. Give ember inspector access to local files
  * Open chrome extensions and select the checkbox in ember that says "Allow access to file URLs"

8. Add real links
  * Add this to the Router function:
  
  ```javascript
  this.resource("posts");
  ```
  * Add link helpers where the anchor tags are:
  
  ```handlebars
  <li>{{#link-to 'posts'}}Posts{{/link-to}}</li>
  <li>{{#link-to 'about'}}About{{/link-to}}</li>
  ```
  * Add style for active links in styles.css
  
  ```css
  .active{
    font-weight:bold;
  }
  ```
  **Note:** Ember automatically applies this class to active links

  9. Add posts page
    * Add this template to index.html
    
    ```handlebars
    <script type="text/x-handlebars" id="posts">
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <table class='table'>
            <thead>
              <tr><th>Recent Posts</th></tr>
            </thead>
            {{#each model}}
            <tr><td>
                {{title}} <small class='muted'>by {{author.name}}</small>
            </td></tr>
            {{/each}}
          </table>
        </div>
        <div class="span9">
          {{outlet}}
        </div>
      </div>
    </div>
  </script>
  ```
  * Add this json object to app.js
  
  ```javascript
  var posts = [{
  id: '1',
  title: "Rails is Omakase",
  author: { name: "d2h" },
  date: new Date('12-27-2012'),
  excerpt: "There are lots of à la carte software environments in this world. Places where in order to eat, you must first carefully look over the menu of options to order exactly what you want.",
  body: "I want this for my ORM, I want that for my template language, and let's finish it off with this routing library. Of course, you're going to have to know what you want, and you'll rarely have your horizon expanded if you always order the same thing, but there it is. It's a very popular way of consuming software.\n\nRails is not that. Rails is omakase."
}, {
  id: '2',
  title: "The Parley Letter",
  author: { name: "d2h" },
  date: new Date('12-24-2012'),
  excerpt: "My [appearance on the Ruby Rogues podcast](http://rubyrogues.com/056-rr-david-heinemeier-hansson/) recently came up for discussion again on the private Parley mailing list.",
  body: "A long list of topics were raised and I took a time to ramble at large about all of them at once. Apologies for not taking the time to be more succinct, but at least each topic has a header so you can skip stuff you don't care about.\n\n### Maintainability\n\nIt's simply not true to say that I don't care about maintainability. I still work on the oldest Rails app in the world."  
}];
```
* Add this route to app.js to tell the template which model to use
  
  ```javascript
    App.PostsRoute = Ember.Route.extend({
    model: function() {
      "use strict";
      return posts;
    }
  });
  ```

10. Make it so when you click on a post it shows the details of it
  * Add a new resource with a path
  
  ```javascript
  this.resource("post", { path: ":post_id" });
  ```
  * Add this template to index.html
  
  ```handlebars
  <script type="text/x-handlebars" id="post">
    <h1>{{title}}</h1>
    <h2>by {{author.name}} <small class='muted'>({{date}})</small></h2>

    <hr>

    <div class='intro'>
      {{excerpt}}
    </div>

    <div class='below-the-fold'>
      {{body}}
    </div>
  </script>
  ```
  * Add link to helpers around the post title, with which model should be passed in (e.g. this);
  
  ```handlebars
  {{#link-to 'post' this}}
  
  * Make it a nested route
    - Add a callback to the posts resource and move the post route into it so it looks like this:
    
    ```javascript
      this.resource("posts", function() {
      this.resource("post", { path: ":post_id" });
    });
    ```

11. Add editing functionality
  * Add dynamic editing button to post template
  
  ```handlebars
    {{#if isEditing}}
      {{partial 'post/edit'}}
      <button {{action 'doneEditing'}}>Done</button>
    {{else}}
      <button {{action 'edit'}}>Edit</button>
    {{/if}}
  ```
  * Add controller to App.js
  
  ```javascript
  App.PostController = Ember.ObjectController.extend({
    isEditing: false,

    edit: function() {
      "use strict";
      this.set("isEditing", true);
    },

    doneEditing: function() {
      "use strict";
      this.set("isEditing", false);
      this.get("store").commit();
    }
  });
  ```
  * Add an editing template that will be pulled in via the partial helper
  
  ```handlebars
  <script type="text/x-handlebars" id="post/_edit">
    <p>{{input type="text" value=title}}</p>
    <p>{{input type="text" value=excerpt}}</p>
    <p>{{textarea value=body}}</p>
  </script>
  ```

12. Make it so when url has a post id in it, the app will know what to return and not error
  * Add new route for post
  
  ```javascript
  App.PostRoute = Ember.Route.extend({
    model: function(params) {
      return posts.findBy('id', params.post_id);
    }
  });
  ```

13. Make date handler helper
  * Include this in app.js
  
  ```javascript
  Ember.Handlebars.helper("format-date", function( date ) {
    "use strict";
    return moment( date ).fromNow();
  });
  ```
  * Add format helper to template where date is outputted

  ```handlebars
  {{format-date date}}
  ```

14. Make a markdown helper
  * Add this to app.js

  ```javascript
  var showdown = new Showdown.converter();

  Ember.Handlebars.helper('format-markdown', function(input) {
    return new Handlebars.SafeString(showdown.makeHtml(input));
  });
  ```
  * Add helpers to excerpt and body
  
  ```handlebars
  {{format-markdown body}}
  {{format-markdown excerpt}}
  ```
