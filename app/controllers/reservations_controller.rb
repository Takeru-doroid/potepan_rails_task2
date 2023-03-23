class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    reservations = @reservations
    @myreservations = current_user.reservations
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @room_info = Room.find(params[:room_id])
    @reservation = @room_info.reservations.new
    @reservation.user_id = current_user.id
  end
  
  def confirm
    @room_info = Room.find(params[:room_id])
    @reservation = @room_info.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.room_id = @room_info.id
  end
  
  def create
    @room_info = Room.find(params[:room_id])
    @reservation = @room_info.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
    
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
    
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person)
  end
  
end
