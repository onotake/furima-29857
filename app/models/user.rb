class User < ApplicationRecord
  
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  has_many :items 
  has_many :purchasers
end
