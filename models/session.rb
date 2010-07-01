class Session
  include Mongoid::Document
  include Mongoid::Timestamps

  field :tags, :type => Array, :default => []
  field :organizer
  field :topic
  field :started_at, :type => DateTime
  field :disbanded_at, :type => DateTime

  validates_presence_of :organizer, :topic, :channel
  validates_associated :channel

  before_create :set_starting_date

  belongs_to_related :channel
  has_many_related :messages

  def set_starting_date
    self.started_at = DateTime.now if self.started_at.nil?
  end

end
