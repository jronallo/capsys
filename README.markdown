Collection Achievements and Profiles System (CAPS)
==================================================

This is a simple, throw away application which demonstrates a little of what 
CAPS could help enable. For more on the concept see: http://go.ncsu.edu/dplacaps

To see a running test version of this code see:

    http://capsys.herokuapp.com/

Prerequisites
-------------

### Ruby and Rubygems

So far only tested with Ruby 1.9.2-p290 under rvm.

### MongoDB

Currently tested with mongodb-linux-x86_64-1.8.1. Go to the mongodb
site for installation instructions for your platform. Start up
mongod before continuing.

Installation
------------

Check out the code with:

    git clone git://github.com/jronallo/capsys.git

    cd capsys

Install the required gems:

    bundle install

To start the app:

    rails server

Seed Data
---------

Data is currently seeded from the IMLS DCC Registry OAI-PMH gateway:
http://imlsdcc.grainger.uiuc.edu/

There is a rake task which allows you to load this data into your
development version:

    rake imlsdcc:load

Tests
-----

There are basic BDD-style cucumber tests that can be run with:

    cucumber

The vcr library is used to cache HTTP calls for testing. See the files
under vcr_cassettes.

The rspec tests currently fail because of how the sitemap route has
been nested. If you want to fix this run the failing specs:

    rspec spec

Validations
-----------

The system runs some validations on the collection metadata in order to
store higher quality data. Many of these validations would be better pushed
off to a background job, but some still run within the request thread when
a form is submitted. For instance the URL which is submitted is validated for
being well-formed and is checked for whether it returns a 200 OK status code.
This is due to needing to use the free version of Heroku. With a little bit of
money to enable a background job queue and enable job workers, this could be
rewritten. 

API
---

Since the data is stored as JSON, the application provides a simple JSON API for
retrieving a Collection Profile and all Achievements. Simply append .json to the
end of any profile page or use content-negotiation to request JSON. The following
two will return the same:

    http://localhost:3000/profiles/4ebd5446f14a1c5c31000211.json

    curl -H "Accept: application/json" http://localhost:3000/profiles/4ebd5446f14a1c5c31000211

You can see an example of an API request for every Collection Profile here:

    http://capsys.herokuapp.com/profiles.json

TODO
----

* I have not paid for or set up any background job queue or I would be defering
  validation jobs until later.
* The current validations are not complete. For instance the sitemap validation
  only looks at the sitemap at the given URL. In cases where a that URL is a 
  sitemap index file, only the index file is validated.
* Throw away this code and start over.

Copyright, 2011
---------------

North Carolina State University

Author 
------

Jason Ronallo
