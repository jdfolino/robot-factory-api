ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'
require 'simplecov'

SimpleCov.start 'rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  DatabaseCleaner.strategy = :truncation

  config.before(:each) do
    # Forces all threads to share the same connection.
    ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
  end

  config.before(:all) do
    DatabaseCleaner.start
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.after :all do
    DatabaseCleaner.clean
  end
end

# Handle concurrent connections
module ActiveRecord
  class Base
    mattr_accessor :shared_connection
    attr_accessor :shared_connection

    def self.connection
      shared_connection || retrieve_connection
    end
  end
end
