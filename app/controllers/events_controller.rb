class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = User.find(session[:user_id]).created_events.build
  end

  def create
    @event = User.find(session[:user_id]).created_events.build(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private
    def event_params
      params.require(:event).permit(:date, :location)
    end
end
