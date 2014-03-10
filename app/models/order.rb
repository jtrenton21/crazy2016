class Order < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :order_cart
  attr_accessible :amount, :quantity, :status, :ticket_id, :ticket, :order_cart_id, :order_cart

  

  def full_price
    amount * quantity
  end
end
