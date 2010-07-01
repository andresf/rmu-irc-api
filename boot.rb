SINATRA_ENV = "development" unless defined?(SINATRA_ENV)

require 'rubygems'
require 'bundler'
Bundler.setup

Bundler.require(:default, SINATRA_ENV)

Mongoid.configure do |config|
  name = 'rmu_logs_#{SINATRA_ENV}'
  host = "localhost"
  config.allow_dynamic_fields = false
  config.use_utc = true
  config.master = Mongo::Connection.new.db(name)
end

require 'models/channel'
require 'models/session'
require 'models/message'
