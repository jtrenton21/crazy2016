class ApplicationController < ActionController::Base
  protect_from_forgery
   before_filter :authorize, only: [:edit, :update]
  
	

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
