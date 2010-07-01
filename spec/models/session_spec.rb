require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Session do

  before :each do
    Session.collection.remove

    @session = Session.new
    @channel = Channel.new
    @channel.stubs(:valid?).returns(true)

    @attributes = {
      :tags => ["banana", "chicken"],
      :organizer => "greg",
      :topic => "Chickens and bananas!",
      :channel => @channel
    }

    @session.attributes = @attributes
  end

  it "fails to save without data" do
    Session.new.save.should be_false
  end

  it "saves with valid data" do
    @session.save.should be_true
  end

  it "must belong to a valid channel" do
    @session.channel = Channel.new
    @session.save.should be_false
  end

  it "must have an organizer" do
    @session.organizer = nil
    @session.save.should be_false
  end

  it "must have a topic" do
    @session.topic = nil
    @session.save.should be_false
  end

  it "sets the starting date after creation" do
    @session.save
    @session.started_at.class.should == DateTime
  end

end
