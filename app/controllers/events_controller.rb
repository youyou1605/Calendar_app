class EventsController < ApplicationController
  def index
    @events = Event.all

    respond_to do |format|
      format.html
      format.json { render json: @events.map { |event| event_json(event) } }
    end
  end

  def show
    if date_string?(params[:id])
      @date = Date.parse(params[:id])
      @events = Event.where("date(start_time) = ?", @date)
    else
      @event = Event.find(params[:id])
    end
  end


  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def index_json
    @events = Event.all
    events_json = @events.map do |event|
      {
        title: event.title,
        start: event.start_time.iso8601,
        end: event.end_time.iso8601
      }
    end
    render json: events_json
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :all_day)
  end

  def event_json(event)
    {
      id: event.id,
      title: event.title,
      start: event.start_time.iso8601,
      end: event.end_time.iso8601,
      allDay: event.all_day,
      url: event_path(event)
    }
  end
  def date_string?(str)
    Date.parse(str)
    true
  rescue ArgumentError
    false
  end
end
