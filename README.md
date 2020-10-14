# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.7.1

* System dependencies
	postgresql

* Configuration


* Database creation
bundle exec rake db:create

* Database initialization
bundle exec rake db:schema:load

* How to run the test suite
before all you have to setup test configuration:
DATABASE_URL
MAILHUB_DOMAIN
ARTISTS_URL - example : https://run.mocky.io/v3/46ca2011-8b43-47cf-b3d7-4df003d48469/
bundle exec rspec 

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
To run this application you have to :
 bundle exec rails s

* ...
