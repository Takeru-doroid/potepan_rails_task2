class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end
  
  def myrooms
    @rooms = Room.all
    rooms = @rooms
    @myrooms = current_user.rooms
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id

    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end
  
  def search
    redirect_to root_path if params[:keyword] == ""
    
    @rooms = Room.search(params[:freeword])
    
    @freeword = params[:freeword]
    render "index"
  end
  
  private
  def room_params
    params.require(:room).permit(:room_name, :body, :price, :address, :image)
  end
end
