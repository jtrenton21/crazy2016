class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :category_id, :payment_id
  belongs_to :category
  belongs_to :payment
end
