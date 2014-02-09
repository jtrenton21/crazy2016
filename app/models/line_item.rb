class LineItem < ActiveRecord::Base
  attr_accessible :unit_price, :quantity, :cart_id, :product_id, :cart, :product
  belongs_to :cart
  belongs_to :product
  
  def full_price
    unit_price * quantity
  end
end
