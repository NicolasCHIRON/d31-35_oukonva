class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params['id'])
    if @event.attendances.count > 0 && @event.attendances.find_by(attendee_id: current_user)
      @registered = true
    else
      @registered = false
    end

  end

  def new
    @event = Event.new
  end

  def create
    date_time = DateTime.new(params['event']['start_date(1i)'].to_i,
                            params['event']['start_date(2i)'].to_i,
                            params['event']['start_date(3i)'].to_i,
                            params['event']['start_date(4i)'].to_i,
                            params['event']['start_date(5i)'].to_i)
    @event = Event.new(start_date: date_time,
      duration: params['event']['duration'].to_i, 
      title: params['event']['title'], 
      description: params['event']['description'],
      location: params['event']['location'],
      administrator_id: current_user.id,
      price: params['event']['price'].to_i)
    if @event.save
      flash[:notice] = "L'évènement a bien été créé !"
      redirect_to '/'
    else
      flash[:alert] = @event.errors.full_messages[0]
      render new_event_path
    end
  end

  def edit
    @event = Event.find(params['id'])
    puts params
    puts "&" * 60
  end

  def update
    @event = Event.find(params['id'])
      if @event.update(params.require(:event).permit(:start_date, :duration, :title, :description, :location, :price))
        flash[:notice] = "Votre évènement a bien été mis à jour !"
        redirect_to @event
      else
        flash[:alert] = @event.errors.full.messages[0]
        render 'edit'
      end

  end

  def destroy
    @event = Event.find(params['id'])
    @event.destroy
    flash[:notice] = "L'évènement a été supprimé"
    redirect_to root_path
  end

end
