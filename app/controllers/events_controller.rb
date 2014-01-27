class EventsController < ApplicationController
 
 
  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:weekday)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today  
  end
  
  def schedule
    @event = Event.new
    @events = Event.order(:start_time)
    @eventdays = Eventday.all
  end

  def show
    @event = Event.find(params[:id])

    redirect_to :controller => "events", :action => "schedule"
  end
  
 
  
 
 
  def new
    @event = Event.new

    
  end
 
 
  
  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    
      if @event.save
        redirect_to user_root_path
     
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    
      if @event.update_attributes(params[:event])
      redirect_to user_root_path
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html {redirect_to user_root_path}
      
    end
  end
end
