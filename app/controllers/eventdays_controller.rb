class EventdaysController < ApplicationController
  # GET /eventdays
  # GET /eventdays.json
  def index
    @eventdays = Eventday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventdays }
    end
  end

  # GET /eventdays/1
  # GET /eventdays/1.json
  def show
    @eventday = Eventday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @eventday }
    end
  end

  # GET /eventdays/new
  # GET /eventdays/new.json
  def new
    @eventday = Eventday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eventday }
    end
  end

  # GET /eventdays/1/edit
  def edit
    @eventday = Eventday.find(params[:id])
  end

  # POST /eventdays
  # POST /eventdays.json
  def create
    @eventday = Eventday.new(params[:eventday])

    respond_to do |format|
      if @eventday.save
        format.html { redirect_to @eventday, notice: 'Eventday was successfully created.' }
        format.json { render json: @eventday, status: :created, location: @eventday }
      else
        format.html { render action: "new" }
        format.json { render json: @eventday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventdays/1
  # PUT /eventdays/1.json
  def update
    @eventday = Eventday.find(params[:id])

    respond_to do |format|
      if @eventday.update_attributes(params[:eventday])
        format.html { redirect_to @eventday, notice: 'Eventday was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @eventday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventdays/1
  # DELETE /eventdays/1.json
  def destroy
    @eventday = Eventday.find(params[:id])
    @eventday.destroy

    respond_to do |format|
      format.html { redirect_to eventdays_url }
      format.json { head :no_content }
    end
  end
end
