class EventsController < ApplicationController
  def index
    @events = Event.all
    @prev_events = @events.previous_events
    @upcoming_events = @events.upcoming_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

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
