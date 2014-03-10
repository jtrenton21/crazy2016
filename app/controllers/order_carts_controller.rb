class OrderCartsController < ApplicationController
 def show
    @order_cart = current_order_cart
  end 
end
