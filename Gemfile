source "https://rubygems.org"
ruby "~> 3.3.0"

gem "rails", "~> 8.0.0"
gem "pg", "~> 1.5"
gem "puma", "~> 6.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "bcrypt", "~> 3.1.7"
gem "actiontext", "~> 8.0.0"

group :development, :test do
  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails"
  gem "faker"
  gem "database_cleaner-active_record"
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
