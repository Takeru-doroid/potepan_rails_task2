class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true
  
  with_options presence: true do
    
    validates :start_date
    validates :end_date
    validates :person, numericality: {greater_than_or_equal_to: 1}
    
  end
  
  def stay_days
    (end_date - start_date).to_i
  end
  
  def total_price
    room = Room.find(room_id)
    (end_date - start_date).to_i * person * room.price
  end
  
end
