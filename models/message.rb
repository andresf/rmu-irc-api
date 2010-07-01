class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nick
  field :symbol
  field :text

  validates_presence_of :nick, :symbol, :text, :session
  validates_associated :session

  belongs_to_related :session

end
