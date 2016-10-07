<h4>0.18.0</h4>

* Update UserAPI class to use new endpoint
* Added Workflow Classes: workflow, stage, task

<h4>0.17.4</h4>

* rubocop fixes

<h4>0.17.3</h4>

* added app.extension for adding extenisons to app

<h4>0.17.2</h4>

* app_provider and app create json error fix

<h4>0.17.1</h4>

* comment.list_all added

<h4>0.17.0</h4>

* app endpoint
* app_provider endpoint
* added content.edit, which is the same as content.update
* puts project.list to default with { :include_description => true }
* ablility to set timout for requests.

<h4>0.16.3</h4>

* Removed defalt config for content types

<h4>0.16.2</h4>

* Added Publisher Edit, Added options to Business Unit list endpoint

<h4>0.16.1</h4>

* Update content.list_all to have optional debug for stat and page output

<h4>0.16.0</h4>

* Added personas endpoint

<h4>0.15.3</h4>

* Added options to user.add

<h4>0.15.1</h4>

* Headers updated with "Content-Type" => "application/x-json"

<h4>0.15.0</h4>

* Projects
* Business Units
* Languages

<h4>0.14.3</h4>

* network_id helper function that returns the users network id based on the first post returned from post list

<h4>0.14.2</h4>

* force live content for root user only

<h4>0.14.1</h4>

* Use environment variable http_proxy for proxy settings

<h4>0.14.0</h4>

* Breaking Change for content.add: publish_date is no longer required. If it needs to be supplied add it to options.
* Breaking Change for content.add: slug is no longer required. It will be auto generated on the backend. If it needs to be supplied add it to options.

<h4>0.13.3</h4>

* Fix for content.add

<h4>0.13.2</h4>

* Update for post endpoing remediation

<h4>0.13.1</h4>

* Fix for List all Content due to Compendium API update to rename post to content

<h4>0.13.0</h4>

* Added public API access helpers
* Updated error handling for bad requests

<h4>0.12.1</h4>

* Fix for post update

<h4>0.12.0</h4>

* Added support for Content Types

<h4>0.11.0</h4>

* Added support for Post Tasks

<h4>0.10.7</h4>

* Added non 200 status code catch and display

<h4>0.10.6</h4>

* Updated content.list_all to return results consitent to content.list

<h4>0.10.5</h4>

* Added Debug Capabilities with Environment Variable DEBUG=true

<h4>0.10.4</h4>

* Added user id helper function as well as first live post id helper funtion

<h4>0.10.3</h4>

* Updated Callback function for network_id and schedule options

<h4>0.10.2</h4>

* Updated user list function to use /api/user instead of /app/user

<h4>0.10.1</h4>

* Move post endpoint to use /api instead of /app to go along with new Compendium Workflow Release
* Approve has been removed from the content class
* Added idea creation for content class

<h4>0.10.0</h4>

* Added Callback Support

<h4>0.9.0</h4>

* Added Role endpoint support
* Added calendar event delete support

<h4>0.8.0</h4>

* Added Custom Field endpoint support

<h4>0.7.1</h4>

* Ability to call session.user.get with no arguments, which will return own user

<h4>0.7.0</h4>

* Added Calendar Endpoint Support - Events and Add
* Organized and Expanded examples

<h4>0.6.2</h4>

* Added exporter function

<h4>0.6.1</h4>

* Added list_all for content
* Bug Fix: Resolved options merge bug

<h4>0.6.0</h4>

* Support for Content Groups

<h4>0.5.1</h4>

* added Publisher Get

<h4>0.5.0</h4>

* Support for Publisher List

<h4>0.4.5</h4>

* Added Get function for User and Comment
* Bug Fixes

<h4>0.4.4</h4>

* Updated gemspec
* Bug Fixes

<h4>0.4.3</h4>

* Breaking Change: Udpated Organization of each area of the API for new function call structure

<h4>0.4.2</h4>

* Breaking Change: updated post wording to content to match current language

<h4>0.4.1</h4>

* Moved get_post to /api/posts endpoint

<h4>0.4.0</h4>

* Added Helper Class
* Added slugify function

<h4>0.3.0</h4>

* Added Comment Functinality
* Added Category Functinality

<h4>0.2.0</h4>

* Added User Management Functinality

<h4>0.1.0</h4>

* Added Post Management Functinality

<h4>0.0.0</h4>

* Built Initial Gem
