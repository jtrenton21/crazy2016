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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render json: @content, status: :created, location: @content }
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.json
  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to :controller => "users", :action => "index", notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to users_path}
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    respond_to do |format|
      
        format.html { redirect_to users_path}
      
    end
  end
end
