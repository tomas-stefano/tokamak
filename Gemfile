source "http://rubygems.org"
# Add dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development do
  gem "rspec", "~> 2.3.0"
  gem "bundler", "~> 1.0.0"
  gem "jeweler", "~> 1.5.2"
  gem "rcov", ">= 0"
	if RUBY_VERSION < "1.9"
	  gem "ruby-debug"
	else
	  gem "ruby-debug19", :require => "ruby-debug"
	end
end

group :test do
	gem "nokogiri"
end

gem "activesupport", ">= 3.0.0"
gem "actionpack", ">= 3.0.0"
gem "libxml-ruby"
