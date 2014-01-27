class ContentsController < ApplicationController
 
 require 'mini_magick'
  
  def index
    @content = Content.new
    @search = Content.joins(:visit).search(params[:q])
    @contents = @search.result
    @contents = @contents.joins(:visit)
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end
  
  def search
    gallery
    render :gallery
  end

  def gallery
    @contnet= Content.all
    @content = Content.new
    @search = Content.joins(:visit).search(params[:q])
    @contents = @search.result
    @contents = @contents.joins(:visit)
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
   
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])

    redirect_to :controller => "contents", :action => "gallery"
  end

  # GET /contents/new
  # GET /contents/new.json
  def new
    @content = Content.new

    
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(params[:content])

      if current_user
        if @content.save
          redirect_to user_root_path
        else
          format.html { redirect_to @content, notice: 'Content was successfully created.' }
          format.json { render json: @content, status: :created, location: @content }
        end
      end
  end

  # PUT /contents/1
  # PUT /contents/1.json
  def update
    @content = Content.find(params[:id])

   
      if @content.update_attributes(params[:content])
         redirect_to user_root_path
    
      end
  end

 
  def destroy
    @content = Content.find(params[:id])
    if @content.destroy
      redirect_to user_root_path
    end  
  end
end
