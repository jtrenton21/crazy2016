class Category < ActiveRecord::Base
  attr_accessible :name, :products_attributes
  has_many :products
end
