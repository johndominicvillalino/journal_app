
require 'simplecov'
SimpleCov.start do 
    add_filter "test/integration/create_category_test.rb"
    add_filter "app/controllers/turbo_devise_user_controller.rb"
    add_filter "config/initializers/devise.rb"
    add_filter "app/helpers/application_helper.rb"
    add_filter 'test/controllers/tasks_controller_test.rb'
end


ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

end
