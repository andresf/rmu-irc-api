require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../app.rb')

describe App do

  def app 
    App
  end
 
  it "respones to channel index" do
    get "/channels"
    last_response.content_type.should == "application/json"
  end

  it "responds to invalid channel post with errors" do
    post "/channels", :channel => {}
    last_response.body.should match /can.t be blank/
  end

  it "responds to valid channel post with the created channel" do
    post "/channels", :channel => {:name => "rmu-general", 
      :server => "chat.freenode.net"}
    last_response.body.should match /created_at/
  end

end
