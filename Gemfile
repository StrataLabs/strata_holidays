source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', :group => :development

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

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

gem "devise", "~> 3.0.0.rc"
gem "less-rails"
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.0.3'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'haml-rails'

gem 'pg' , :group => :production

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

group :test do
  gem "shoulda-matchers"
end

gem "simple_form", :git => 'git@github.com:plataformatec/simple_form.git' , :branch => 'master'