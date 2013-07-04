source 'https://rubygems.org'

gem 'rails', '~> 3.2.13'
gem 'rack', '~> 1.4.5'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "rails-erd"
  gem "sqlite3"
end

group :test do
  gem "sqlite3"
end


gem 'can_be_tagged', :git => 'git://github.com/zherk/can_be_tagged.git'

gem 'devise'
gem 'jquery-rails'
gem "less-rails-bootstrap", "~> 2.3.2"

if defined?(JRUBY_VERSION)
  gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'jruby-openssl'
  gem 'jruby-rack'
  gem 'warbler'
  gem 'therubyrhino'
else
  gem 'therubyracer'
  gem 'pg'
end

gem 'nested_form'
gem 'simple_form'
gem 'rails_bootstrap_navbar'

# This version needs to be hardcoded for OpenShift compatability
gem 'thor', '= 0.14.6'

# This needs to be installed so we can run Rails console on OpenShift directly
gem 'minitest'
