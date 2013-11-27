class Visit < ActiveRecord::Base
  attr_accessible :location, :vdate
  has_many :contents
end
