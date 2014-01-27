class ArticlesController < ApplicationController
 
  def index
    @articles = Article.all
    @articles = Article.order(:title).page(params[:page])
  end

  def news
    @articles = Article.all
    @articles = Article.order(:title).page(params[:page])
  end

  
  def show
    @article = Article.find(params[:id])
  end

 
  def new
    @article = Article.new
  end

  
  def edit
    @article = Article.find(params[:id])
  end

 
  def create
    @article = Article.new(params[:article])

    
      if @article.save
       redirect_to user_root_path
      
    end
  end

  
  def update
    @article = Article.find(params[:id])

    
      if @article.update_attributes(params[:article])
        redirect_to user_root_path
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy

    
      redirect_to user_root_path 
      
    end
  end
end
