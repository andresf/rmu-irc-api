class Channel
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :server

  validates_presence_of :name, :server

  has_many_related :sessions
end
