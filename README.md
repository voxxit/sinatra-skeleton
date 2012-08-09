Sinatra Skeleton
================

This is the basic setup for a barebones Sinatra app to get you started. The first things I
usually want to do are set up the app structure and ORM -- in most cases, [DataMapper](http://datamapper.org/).
Then, of course, who wants to write plain-ol' Javascript anymore? I also like to set up
[Sprockets](https://github.com/sstephenson/sprockets), which is the same asset solution used
in Rails.

Grabbing the source
-------------------

To get started, you can [download the latest](https://github.com/voxxit/sinatra-skeleton/zipball/master) source
and just include it in your existing or new repo.

Running the app
---------------

This Sinatra app uses thin for a web server, so all you have to do is:

    $ bundle && rackup
    
This will install all required gems in your Gemfile, then start the server on port 9292.

Using assets
------------

Set up your JS and CSS files (as CoffeeScript and SASS files, respectively) in the `assets/` folder. Then,
you can link to them in the following manner:

    /assets/javascripts/application.js.coffee -> /assets/application.js
    /assets/stylesheets/application.css.scss  -> /assets/application.css

In production, this is:

    /assets/javascripts/application.js.coffee -> /assets/application.min.js
    /assets/stylesheets/application.css.scss  -> /assets/application.min.css

NOTE: Currently assets are not minified in production.

Precompiling assets
-------------------

Assets will automatically precompile when you push to Heroku. However, if you want to do this manually in your development environment, use:

    $ bundle exec rake assets:precompile

NOTE: Currently assets are not minified by this script.

Pushing to Heroku
-----------------

I don't include a deployment strategy here. For most people, they'll either be using Heroku, or 
will want to roll their own deployment. Here's how you can easily push to Heroku.

    $ heroku create
    $ git push heroku master
    $ heroku open
    
Congrats! You've got a fully working Heroku app!