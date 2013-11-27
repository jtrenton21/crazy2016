class Eventday < ActiveRecord::Base
  attr_accessible :day, :month, :date, :year
 

  # def eventday_with_date
  # "#{self.eventday.day} #{self.eventday.month} #{self.eventday.date}#{self.eventday.year}"
  # end



end
