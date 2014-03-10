class ProductsController < ApplicationController
  def search
    index
    render :index
  end

  def index
    @product= Product.all
    @content = Product.new
    @search = Product.joins(:category).search(params[:q])
    @products = @search.result
    @products = @products.joins(:category)
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
   
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      
      redirect_to user_root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      
      redirect_to user_root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
    redirect_to user_root_path
  end
end
