source 'https://rubygems.org'

ruby '2.1.3'
gem 'rails', '4.2.0'
gem 'mongoid', '~> 4.0.2'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.10'
gem 'quiet_assets', '~> 1.1.0'

### CarrierWave Gems ###
gem 'carrierwave'
gem 'carrierwave-mongoid'
gem 'fog' # required for Amazon S3
gem 'mini_magick' # post upload image processing
gem 'rmagick', '~> 2.13.4'
gem 'figaro'

gem 'will_paginate', '~> 3.0.6'
gem 'bootstrap-will_paginate'
gem 'will_paginate_mongoid'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'better_errors'
  gem 'pry'
  gem 'rspec-rails', '~> 3.2.1'
end

# gem to make css work better in heroku
gem 'rails_12factor', group: :production

# gem for thin
gem 'thin', group: :production

# gems for testing and continuous integration
gem 'factory_girl_rails', '~> 4.5.0'
gem 'capybara', '~> 2.4.4'
gem 'poltergeist', '~> 1.6.0'
gem 'database_cleaner', '~> 1.3.0'
gem 'rspec_junit_formatter', :github => 'circleci/rspec_junit_formatter', group: :test

group :test do
  gem 'shoulda-matchers', require: false
end