class ApplicationController < ActionController::Base
  protect_from_forgery
   before_filter :authorize, only: [:edit, :update]
  
	def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

  private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def admin
		@admin = current_user
	end

	def authorize
	  redirect_to login_url, alert: "Not authorized" if current_user.nil?
	end



  
  
end


