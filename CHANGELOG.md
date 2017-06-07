# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
 * Released gem
  
### Changed

### Fixed

### Removed

### Deprecated

## [0.4.0 - 2017-06-07]
### Added
 * Tested with Ruby 2.4.0
 * Tested with Sequel 4.46.0
  
### Changed
 * Updated the documentation with minor edits

### Fixed

### Removed

### Deprecated

## [0.4.0.dev] - 2017-03-19
* Welcome to 2017!
* Forked on January 9th 2017. 
* It seems that the original code which I forked was last updated on 2012/11/28.
* Thank you Ryan Grove (@rgrove) for Thoth :-)

### Added
* This CHANGELOG
* Added John Pagonis (@pagojo) to copyright messages.
* Added the BSD-3-Clause licence to the GemSpec in the Rakefile
* `Thoth::filesize_format`
* README

### Changed
* Requires Ruby 2.3.0
* Requires Ramaze 2012.12.08
* Requires Innate 2015.10.28
* Requires Sequel 4.42.0
* Requires Rake 11.2.2

### Fixed
* Documentation (see wiki)
* Updated `Thoth::APP_VERSION` and the version.rb
* Updated HISTORY with latest deps
* Update the GemSpecs authors to include both Ryan and John
* fixed `add_runtime_dependency`
* Corrected gemspec runtime dependencies. Specifying a strict gem requirement for Ramaze and Innate from the main code was removed since the gemspec should handle this, unless there is a very good reasondo do it explicitly from the code (which there was none).  
* Updated the Rakefile
* Moved the main controller view inside `view/thoth/` because Innate expects a main controller which belongs to a module to be in a subpath named after that module. Basically these days `Module::MainController` should map to `/module`.    
 This also fixed "no index page found for MainController"
* Fixed innate rendering of Admin `MainController` -> "No Action `:css` on `Thoth::MainController`"  
 It didn't find the views required from the `layout`. When the MainController views are moved into the `view/thoth` folder it works
* Moved the util views inside `views/thoth/util` and revisited all views that use Main controller util views and updated their paths  
 This also fixes all calls from within views to Thoth::MainController.render_view('util/helper_view_x') calls which were failing
* Fixed media file upload: In media.rhtml  (NoMethodError at /media/edit/1 , undefined method `filesize_format`)  
 removed filesize_format for now and added `Thoth::filesize_format`
*  Fixed media list: `NoMethodError` at `/media/list` undefined method `filesize_format` for Fixnum  
 `filesize_format` seems to have moved to rack from Ramaze and then disappeared?
 [It has moved to the `Rack::Directory` middleware](https://github.com/rack/rack/blob/master/lib/rack/directory.rb).
 Used `Thoth::filesize_format` instead
* Fixed `NoMethodError`: undefined method `desc` for `:created_at:Symbol` on `post/list`  
 This was due to the `Sequel.desc` incompatibility between Thoth and newer Sequel
* Finally gave up and fixed  `map '/'` in `MainController`
* Fixed `NoMethodError` at `/page/list` , undefined method `paginate` for `Thoth::Page:Class`  
 Refactored to use the Sequel pagination plugin and reordered the location of pagination  
 `@pages = Page.order(@order == :desc ? Sequel.desc(@sort) : @sort).paginate(page, 20)`  
 `Used Sequel.desc`
* Fixed `NoMethodError` at `/comment/list`, undefined method `paginate` for `Thoth::Comment:Class`
 Refactored to use the Sequel pagination plugin
* Fixed `NoMethodError` at `/media/list` , undefined method `paginate` for `Thoth::Media:Class`
* Fixed Login, At the moment `auth_key_valid?` seemed not to work due to `cookie(:thoth_auth)` being empty  
 The correct credentials seem to be recognised on the Admin::login action  
 Cookie setting didn't work because the path given to the cookie was `/thoth/` and not `'/'`   
 This needs to be revisited and probably refactored in the Cookie Helper
* Fixed `page/new` to set the right cookie path to `'/'`  
 It did not render the form because the `auth_key_valid?` failed and the path for the `thoth_auth` cookie  was set to `/admin` because the default path setting was the path of the controller it was set in
 * Fixed `page/preview` to set the right cookie path to `'/'`  
   the `form_token_valid?` failed to authenticate due to `form_token` because the `form_token` cookie didn't seem exist.  
   Again the problem was the path of the cookie which was set to the MainController. This is a problem 	because the main controller does not get wired on '/', so the assumption is broken.
* Fixed `NoMethodError`: undefined method `paginate` in `lib/thoth/model/post.rb:84`:in `recent` "  
 Refactored to use the Sequel Pagination extension.
* Updated to the latest Ramaze Middleware API
* Update to the latest rack middleware wiring
* Fixed `Model/Page` incompatibility with latest Sequel
* Updated `Rakefile` to modern rake.
* Wiki documentation regarding custom themes

### Deprecated
* The [HISTORY](/HISTORY) file is now there for ....historic reasons

### Removed
* `require 'rubygems'` was removed from the code
* Twitter plugin
* Thoth logo

		
[Unreleased]: https://github.com/pagojo/rethoth/compare/v0.4.0...HEAD
[0.4.0]: https://github.com/pagojo/rethoth/compare/v0.4.0...v0.4.0

