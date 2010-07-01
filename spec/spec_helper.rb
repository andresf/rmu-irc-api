SINATRA_ENV = "test" unless defined?(SINATRA_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../boot")

Spec::Runner.configure do |conf|
  conf.include Rack::Test::Methods
  conf.mock_with :mocha
end
