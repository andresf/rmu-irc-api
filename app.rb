require 'boot'

#Haven't made it work as Sinatra::Base in apache/passenger
#class App < Sinatra::Base

  def criteria_to_json criteria
    criteria.each.map{ |doc| (response ||= []) << doc }.flatten.to_json
  end

  def parse_json data
    begin
      json = JSON.parse(data)
    rescue
      halt 400, "Bad Request"
    end
  end

  get '/' do
    "Hello there!"
  end

  get '/channels' do
    content_type :json
    criteria_to_json(Channel.all)
  end

  get '/sessions' do
    content_type :json
    criteria_to_json(Session.all)
  end

  get '/messages' do
    content_type :json
    criteria_to_json(Message.all)
  end

  post '/channels' do
    content_type :json

    params = request.body.read
    channel = Channel.create(parse_json params)
    
    if channel.valid?
      channel.to_json
    else
      channel.errors.to_json
    end
  end

  post '/sessions' do
    content_type :json

    params = request.body.read
    session = Session.create(parse_json params)
    
    if session.valid?
      session.to_json
    else
      session.errors.to_json
    end
  end

  post '/messages' do
    content_type :json

    params = request.body.read
    message = Message.create(parse_json params)
    
    if message.valid?
      message.to_json
    else
      message.errors.to_json
    end
  end

#end
