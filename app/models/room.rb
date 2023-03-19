class Room < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :reservations, dependent: :destroy
    
    with_options presence: true do
        
        validates :room_name
        validates :body
        validates :price
        validates :address
        validates :image
        
    end
    
    def self.search(freeword)
        where(["room_name like? OR body like? OR address like?", "%#{freeword}%", "%#{freeword}%", "%#{freeword}%"])
    end
    
end
