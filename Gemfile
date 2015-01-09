source 'https://rubygems.org'
ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'

# Was using  ActiveModel has_secure_password, now use devise
 gem 'devise'

  gem 'ember-rails'
  gem 'ember-source', '1.4.0'
  gem 'ember-data-source', '1.0.0.beta.7'
  gem 'active_model_serializers'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

#provides nice feedback for form errors
gem 'bootstrap_form'

#provides styling for bootstrap
gem 'bootstrap-sass'

gem 'haml-rails'

group :development do
  # provides more information when error occurs
  gem "better_errors"
  # Preview mail in the browser instead of sending.
  gem 'letter_opener'
  #  Thin is a Ruby web server  
  #  gem 'thin'

end

group :development, :test do
# Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0'
  gem 'fabrication'  # fabricate objects for rspec
  gem 'faker'   #more easily create data for fabricator 
  gem 'pry'  #stops execution for debugging
  # Teaches Pry about step, next, and continue to create a simple debugger.  
  # gem 'pry-nav'
end

group :test do
#  gem 'database_cleaner', '1.2.0'
  # adds matchers for rspec, but doesn't work if you require here
  # has to be required later, in the spec_helper or rails_helper
  # after rails itself is loaded
  gem 'shoulda-matchers', require: false
  #capybara for feature testing
  gem 'capybara'
  gem 'capybara-email'
  gem 'launchy' #implements save_and_open_page
  # makes direct calls to the browser using each browser's native support for automation
  #  gem 'selenium-webdriver'
  # vcr saves cassettes so api calls dont have to be repeated
  #  gem 'vcr'
  # Library for stubbing and setting expectations on HTTP requests
  #  gem 'webmock'
end

group :production do
  #postgres database
  gem 'pg'
  #recommended by heroku. See https://devcenter.heroku.com/articles/getting-started-with-rails4#heroku-gems
  gem 'rails_12factor' 
end
############################################
#Below were created by rails new command

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
#gem 'spring',        group: :development



# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

