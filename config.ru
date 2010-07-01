require 'rubygems'
require 'sinatra'

root_dir = File.dirname(__FILE__)

set :environment, ENV['RACK_ENV'].to_sym
set :root,        root_dir
set :app_file,    File.join(root_dir, 'app.rb')
disable :run
enable :raise_errors

log = File.new("sinatra.log","a")
STDOUT.reopen(log)
STDERR.reopen(log)

require 'app'

run Sinatra::Application