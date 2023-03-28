class Room < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :reservations, dependent: :destroy
    
    validates :room_name, presence: true
    validates :body, presence: true
    validates :price, presence: true
    validates :address, presence: true
    
    def self.search(freeword)
        where(["room_name like? OR body like? OR address like?", "%#{freeword}%", "%#{freeword}%", "%#{freeword}%"])
    end
    
end
