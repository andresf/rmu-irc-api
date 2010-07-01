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
    channel = Channel.create(params[:channel])
    
    if channel.valid?
      channel.to_json
    else
      channel.errors.to_json
    end
  end

  post '/sessions' do
    content_type :json
    session = Session.create(params[:channel])
    
    if session.valid?
      session.to_json
    else
      session.errors.to_json
    end
  end

  post '/messages' do
    content_type :json
    message = Message.create(params[:channel])
    
    if message.valid?
      message.to_json
    else
      message.errors.to_json
    end
  end

end
