source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails' # Rspec testing
  gem 'factory_girl_rails', '~> 4.0' # Factories GEM for DRYing up tests
  gem 'database_cleaner' # Cleans database between tests
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.3.1.0'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'faker'
gem 'devise' # User account GEM
gem 'cancan' # Authentication GEM
gem 'redcarpet' # Markdown GEM
gem 'carrierwave' # File uploading GEM
gem 'mini_magick' # Image manipulation GEM
gem 'fog' # Cloud based storage GEM
gem 'figaro', git: 'git://github.com/laserlemon/figaro.git' # Credential Handling GEM
gem 'will_paginate', '~> 3.0' # Pagination GEM
gem 'omniauth-facebook' # Gem to handle Facebook logins