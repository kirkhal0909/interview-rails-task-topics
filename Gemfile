source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'activeadmin'
gem 'babosa', require: false
gem 'carrierwave', '~> 2.0'

gem 'pg', '1.3.5'
gem 'puma', '~> 3.11'
gem 'rails', '5.2.7.1'
gem 'sass-rails', '~> 5.0'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', require: false
end

group :development do
  gem 'spring', '3.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
