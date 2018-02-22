ruby '2.4.1'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
  gem "factory_bot"
  gem "capybara"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'guard-rspec', require: false
end

group :test do
  gem "selenium-webdriver"
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'faker'
  gem "database_cleaner"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'stripe' # I've not generated views yet	
gem 'friendly_id', '~> 5.1.0'
gem 'gibbon', github: "amro/gibbon"
gem 'stripe'

gem "rails-controller-testing", "~> 1.0"
