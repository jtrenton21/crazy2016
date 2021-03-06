class SlidesController < ApplicationController
  # GET /slides
  # GET /slides.json
  def index
    @slides = Slide.all

   
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
    @slide = Slide.find(params[:id])

   
  end

  # GET /slides/new
  # GET /slides/new.json
  def new
    @slide = Slide.new

   
  end

  # GET /slides/1/edit
  def edit
    @slide = Slide.find(params[:id])
  end

  # POST /slides
  # POST /slides.json
  def create
    @slide = Slide.new(params[:slide])

    respond_to do |format|
      if @slide.save
       redirect_to user_root_path
      else
        redirect_to user_root_path
      end
    end
  end

  # PUT /slides/1
  # PUT /slides/1.json
  def update
    @slide = Slide.find(params[:id])

    respond_to do |format|
      if @slide.update_attributes(params[:slide])
        redirect_to user_root_path
      else
       redirect_to user_root_path
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to user_root_path}
      
    end
  end
end
