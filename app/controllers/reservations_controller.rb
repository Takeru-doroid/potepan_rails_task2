class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
    reservations = @reservations
    @myreservations = current_user.reservations
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def create
    #@reservation = current_user.reservations.create(reservation_params)
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.save
    
    redirect_to root_path notice: "予約が完了しました"
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :room_id)
  end
end
