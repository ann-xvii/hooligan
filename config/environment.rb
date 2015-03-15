# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

host = "localhost:3000"
Rails.application.routes.default_url_options[:host] = host
