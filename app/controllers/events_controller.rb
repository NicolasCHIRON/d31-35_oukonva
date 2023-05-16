class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params['id'])
  end

  def new
    @event = Event.new
  end

  def create
    puts params
    puts "*"*60
    puts current_user.id
    @event = Event.new
      (start_date= DateTime.new(params['event']['start_date(1i)'].to_i,
                                params['event']['start_date(2i)'].to_i,
                                params['event']['start_date(3i)'].to_i,
                                params['event']['start_date(4i)'].to_i,
                                params['event']['start_date(5i)'].to_i,),
      duration= params['event']['duration'].to_i, 
      title= params['event']['title'], 
      description= params['event']['description'],
      location= params['event']['location'],
      price= params['event']['price'].to_i,
      administrator_id= current_user.id)
    if @event.save
      flash[:notice] = "L'évènement a bien été créé !"
      redirect_to '/'
    else
      flash[:alert] = @event.errors.full_messages[0]
      render new_event_path
    end
  end

end
