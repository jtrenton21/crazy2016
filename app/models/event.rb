class Event < ActiveRecord::Base
  attr_accessible :address, :einfo, :latitude, :longitude, :name, :start_time, :eventday_id
  belongs_to :eventday
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
end
