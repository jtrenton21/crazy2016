class LineItemsController < ApplicationController
  def create
    
      @product = Product.find(params[:product_id])
      @line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price)
      
      redirect_to current_cart_url
    
  end
end