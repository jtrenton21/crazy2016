class UsersController < ApplicationController
	
	def index
		@users = User.all
		@articles = Article.all
    	@articles = Article.order(:title).page(params[:page])
		@article = Article.new
		@content = Content.new
		@contents = Content.all
		@events= Event.all
		@slides = Slide.all
		@slide = Slide.new
		@categories = Category.find(:all)
		@products = Product.all
		@product = Product.new
	end

	def new
	  @user = User.new
	end
	
	def admin
	@user = User.new
	end
	
	def create
	  @user = User.new(params[:user])
	  if @user.save
	    session[:user_id] = @user.id
	    redirect_to user_root_path, notice: "Thank you for signing up!"
	  else
	    render "new"
	  end
	end

end
