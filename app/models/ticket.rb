class Ticket < ActiveRecord::Base
  belongs_to :event
  attr_accessible :date, :description, :event, :price, :time, :event_id
end
