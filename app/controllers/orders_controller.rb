class OrdersController < ApplicationController
 
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @order = Order.create!(:order_cart => current_order_cart, :ticket => @ticket, :quantity => 1, :amount => @ticket.price)
      
      redirect_to current_order_cart_url
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to current_order_cart_url
  end
  
end
