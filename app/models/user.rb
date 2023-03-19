class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    
    with_options uniqueness: true do
    
    validates :username
    validates :email
      
    end
    
  end
  
  attachment :profile_image
  
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
