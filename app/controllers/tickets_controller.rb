class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    flash[:notice] = "Your Transaction is #{params[:st]} for amount of $#{params[:amt]}. Thank You for shopping." if params[:st]
   
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new

   
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:ticket])

    
      if @ticket.save
        redirect_to user_root_path
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        redirect_to user_root_path
      else
        redirect_to user_root_path
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to user_root_path
    
  end
  def notification
    #handle for old deals.
    if params[:item_number1] && !params[:item_number1].empty?
      #paypal sends an IPN even when the transaction is voided.
      if params[:payment_status] != 'Voided'
        @product = Product.find(params[:item_number1].to_i) rescue nil
        @product.orders.build(:quantity => 1, :amount => params[:mc_gross_1], :status => params[:payment_status]).save unless @product.nil?
      end
    end
    render :nothing => true
  end
end
