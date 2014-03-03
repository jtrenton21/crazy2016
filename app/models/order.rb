class Order < ActiveRecord::Base
  belongs_to :ticket
  attr_accessible :amount, :quantity, :status, :ticket_id
end
