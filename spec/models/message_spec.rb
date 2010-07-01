require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Message do

  before :each do
    Message.collection.remove

    @message = Message.new
    @session = Session.new
    @session.stubs(:valid?).returns(true)

    @attributes = {
      :nick => "andres-fc",
      :symbol => "action",
      :text => "likes mongodb",
      :session => @session
    }

    @message.attributes = @attributes
  end

  it "fails to save without data" do
    Message.new.save.should be_false
  end

  it "saves with valid data" do
    @message.save.should be_true
  end

  it "must have a nick" do
    @message.nick = nil
    @message.save.should be_false
  end

  it "must have a symbol" do
    @message.symbol = nil
    @message.save.should be_false
  end

  it "must have text" do
    @message.text = nil
    @message.save.should be_false
  end

  it "must belong to a valid session" do
    @message.session = Session.new
    @message.save.should be_false
  end
  
end
