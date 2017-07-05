# Rethoth 0.4.1 (2017)

#### Rehoth is a simple to understand, run and maintain Ruby blogging engine

Rethoth (previously known as Thoth) is written in [Ruby](https://www.ruby-lang.org) and is based on the [Ramaze web framework](http://ramaze.net/) and the [Sequel database toolkit](http://sequel.jeremyevans.net/). Rethoth 0.4.1 is a modern port, to 2017, of the original Thoth created by @ryangrove.  

## Try Rethoth now!
For a quick start:
```
    gem install rethoth
    gem install sqlite3
	thoth --create test_project
	cd test_project
	thoth --migrate
	thoth
```
Then, point your browser to http://localhost:7000/admin and use 'thoth' as your username and password.

If you want to run or migrate in development mode use the  ```--devel``` switch
e.g.,
```
	thoth --devel --migrate
	thoth --devel
```

Note that the name of the executable is still `thoth`.

## Why Rethoth?
#### Simple
The purpose of Rethoth is to be a simple to understand, run and maintain blogging engine

See the Wiki 
#### Fully featured
Rethoth has the features you need to run a blog without the hassle:
![pic](https://raw.githubusercontent.com/wiki/pagojo/rethoth/images/00_welcome.png)

* [Textile](https://www.promptworks.com/textile) format support.
* Pages and blog post URL names can be specified by the author.
* You can upload files and link to them from sensible URLs. 
* Post and pages can be previewed.
* Posts and pages can be saved as draft.
* Page and post names are automatically validated for uniqueness.
* Tags are supported.
* Tags are suggested as you type when creating or editing a blog post.
* Tag statistics are supported.
* Blog posts provide Atom feeds for recent comments.
* Tag pages provide Atom feeds for posts with that tag.
* Comments can be enabled/disabled per post.
* New comments require an email address.
* Deleted comments remain in the database but are hidden from view
* Comments are sanitised for safe HTML.
* Multiple comments may be deleted at once.
* Gravatar support.
* Flickr plugin.
* Delicious plugin.
* Memcache support.
* Minification of CSS and JS files.
* All admin forms validate a session-specific form token on submission to prevent cross-site request forgery attacks.
* Auto-generates an XML sitemap at http://yourblog.com/sitemap.

#### Educational  

Rethoth demonstrates how to easily build a useful MVC-style app in Ruby without having to deal directly with meta-programming and DSL magic. 

##### No Rails needed 
Rethoth is an example of how to build a web application in Ruby without the need to learn Rails and ActiveRecord. 

##### Feels very familiar to non-Rubyists
Rethoth is also ideal for newcomers to Ruby who have experience with other web frameworks and want to quickly appreciate the language and become productive with it.

## Installation
``` 
gem install rethoth
```
Rethoth depends on:
* Ruby >= 2.3.0
* Ramaze 2012.12.08
* Innate 2015.10.28
* Sequel >=4.42.0
* Rake 12.0.0

You will also have to install a database driver such as sqlite3 or mysql2.
e.g.,
```
gem install sqlite3
```

## Rethoth for developers
##### Building the gem
```
rake install
```

### Customizing Rethoth
See the [Wiki pages](https://github.com/pagojo/rethoth/wiki)

### API Reference
TBD

### Tests
TBD  
Describe and show how to run the tests with code examples.

## Contributors

Thoth was resurrected, updated and brought to 2017 by John Pagonis (@pagojo). It was originally developed between 2008 and 2012 by Ryan Grove (@rgrove). Thank you Ryan! Steven Bedrick (@stevenbedrick) has also contributed.

We had to rename the project to Rethoth due to project name clashes on the Rubygems site. 

#### History
This file was created by [John Pagonis](http://pagonis.org) (@pagojo).  
You can read more about Thoth's 2008--2012 history [here](/HISTORY).

## License
Rethoth uses the ['BSD 3 Clause'](/LICENCE) licence.

Rethoth uses icons from the gorgeous [Silk icon set by famfamfam](http://www.famfamfam.com/lab/icons/silk/), which is licensed under the [Creative Commons Attribution 2.5 license](http://creativecommons.org/licenses/by/2.5/).
