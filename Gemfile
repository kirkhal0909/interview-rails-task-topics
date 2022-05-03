source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'activeadmin'
gem 'active_model_serializers'
gem 'babosa', require: false
gem 'carrierwave', '~> 2.0'
gem 'rswag-api'
gem 'rswag-ui'

gem 'bootstrap', '5.0.0'
gem 'filterrific'
gem 'kaminari'

gem 'pg', '1.3.5'
gem 'puma', '~> 3.11'
gem 'rails', '5.2.7.1'
gem 'sass-rails', '~> 5.0'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'faker' # move to all groups for Heroku db:seed
group :development, :test do
  gem 'byebug'
  gem 'rswag-specs'
end

group :development do
  gem 'spring', '3.1.1'

  #     local CLI
  #
  # gem 'rubocop', require: false   # linter:   rubocop
  # gem 'bumbler', require: false   # check initialize time:   bumbler --initializers; bumbler --all
end

group :test do
  gem 'factory_bot', require: false
  gem 'rspec-rails', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
