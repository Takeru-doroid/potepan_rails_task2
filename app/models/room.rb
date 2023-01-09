class Room < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :reservations
    
    def self.search(freeword)
        where(["room_name like? OR body like? OR address like?", "%#{freeword}%", "%#{freeword}%", "%#{freeword}%"])
    end
    
end
