source 'https://rubygems.org'

gem 'rails', '3.2.12'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end



gem 'can_be_tagged', :git => 'git://github.com/zherk/can_be_tagged.git'

gem 'devise'
gem 'jquery-rails'
gem 'less-rails-bootstrap'

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

gem 'bootstrap_forms'
gem 'nested_form'

# This version needs to be hardcoded for OpenShift compatability
gem 'thor', '= 0.14.6'

# This needs to be installed so we can run Rails console on OpenShift directly
gem 'minitest'
