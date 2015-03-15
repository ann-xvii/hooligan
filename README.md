# Hooligan
###### tagline: it's exactly what it sounds like

Welcome to Hooligan, a place for football/soccer fans worldwide to unite.

## Software used in Hooligan

Hooligan runs on the following technologies:

* Rails 4.1.7
* Ruby 2.1.3
* MongoDB
* Bootstrap 3.3.2
* Nokogiri
* Mechanize
* Circle CI for continuous integration
* Heroku for deployment
* RSpec, Factory Girl, and Capybara for testing


## Ruby Gems installed in Hooligan

Hooligan uses the following gems:

* mongoid
* thin (production server)
* better_errors (streamlined development)
* rails_12factor (heroku deployment)
* bootstrap-sass
* rspec-rails (testing)
* factory_girl_rails (testing)
* capybara (testing)
* mechanize
* carrierwave
* fog
* mini_magick
* figaro
* shoulda-matchers
* rspec_junit_formatter

Run the following commands to use these gems
* To install to your machine, run

```
gem install name_of_gem
```

* To include the gem into your app
	* add each gem to your Gemfile, then
	* run `bundle install`


## Running the test suite in Hooligan
Hooligan uses RSpec, Factory Girl and Capybara for testing models, controllers and features.  Tests are broken down into specific files in the app's `spec` directory. 

* To run all tests, run:
	```
	bundle exec rspec
	```

* To run a specific set of tests, simply include the file path. Here is an example for the users_controller_spec.rb:
	```
	bundle exec rspec spec/controllers/users_controller_spec.rb
	```

## Thanks for visiting Hooligan!

Feel free to ask questions or send pull requests. Donations can be made in pizza or green tea. Enjoy!






