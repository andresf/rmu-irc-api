require 'boot'

class App < Sinatra::Base

  get '/channels' do
    content_type :json
    Channel.all.documents.to_json
  end

  get '/sessions' do
    content_type :json
    Session.all.documents.to_json
  end

  get '/messages' do
    content_type :json
    Message.all.documents.to_json
  end

  post '/channels' do
    content_type :json
    params = JSON.parse(request.body.read.to_s) 
    channel = Channel.create(params)
    
    if channel.valid?
      channel.to_json
    else
      channel.errors.to_json
    end
  end

  post '/sessions' do
    content_type :json
    params = JSON.parse(request.body.read.to_s)
    session = Session.create(params)
    
    if session.valid?
      session.to_json
    else
      session.errors.to_json
    end
  end

  post '/messages' do
    content_type :json
    params = JSON.parse(request.body.read.to_s)
    message = Message.create(params)
    
    if message.valid?
      message.to_json
    else
      message.errors.to_json
    end
  end

end
