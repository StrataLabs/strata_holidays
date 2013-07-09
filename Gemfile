source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 4.0.0"

# Use sqlite3 as the database for Active Record
gem 'sqlite3', :group => :development

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails", "~> 3.0.1"
gem "jquery-ui-rails", "~> 4.0.3"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

#Authentication
gem "devise", "~> 3.0.0.rc"

#CSS
gem "less-rails"
gem 'sass-rails', '~> 4.0.0.rc1'
# gem "compass-rails", "~> 1.0.3"
gem "compass-rails", github: "milgner/compass-rails", branch: "rails4"
gem "compass-normalize", "~> 1.4.3"
gem "susy", "~> 1.0.9"

gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.0.3'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

#Html
gem 'haml-rails'

#db for heroku
gem "pg", "~> 0.15.1"

#fulltext search
gem "pg_search", "~> 0.7.0"

group :production do
 # For Heroku
 gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
 gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

group :development, :test do
  gem "rspec-rails", "~> 2.13.2"

  #Factory Girl instead of Fixtures
  gem "factory_girl_rails", "~> 4.0"

  gem 'debugger'
end

group :development do
  #Guard Goodies
  gem "guard-bundler", "~> 1.0.0"
  gem "guard-rspec", "~> 3.0.2"

  #Spork and related guard
  gem 'spork-rails', github: 'railstutorial/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'

  # Guard and LiveReload - Install LiveReload Chrome Extension as well
  gem "guard-livereload", "~> 1.4.0"
  gem "growl", "~> 1.0.3"

  # Better Errors and Rails Panel - Install RailsPanel Chrome Extension as well
  gem "better_errors", "~> 0.9.0"
  gem "binding_of_caller", "~> 0.7.2"
  gem "meta_request", "~> 0.2.6"
end

#rspec shoulda
group :test do
  gem "shoulda-matchers"
end

#simple_form
gem "simple_form", :git => 'https://github.com/plataformatec/simple_form.git' , :branch => 'master'
gem "country_select", "~> 1.1.3"

#code coverage
gem 'coveralls', require: false

#pagination
gem "will_paginate", "~> 3.0.4"

#heroku
gem 'rails_12factor', group: :production

#multiple select
gem "chosen-rails", "~> 0.10.0"

#sunspot
gem "sunspot_rails", "~> 2.0.0"
gem "sunspot_solr", "~> 2.0.0"