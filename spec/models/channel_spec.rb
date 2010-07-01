require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Channel do

  before :each do
    Channel.collection.remove
   
    @channel = Channel.new
    
    @attributes = {
      :name => "rmu",
      :server => "chat.freenode.net"
    }

    @channel.attributes = @attributes
  end

  it "fails to save without data" do
    Channel.new.save.should be_false
  end
  
  it "saves with valid data" do
    @channel.attributes = @attributes
    @channel.save.should be_true
  end

end
