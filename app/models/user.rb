class User < ApplicationRecord
  
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, presence: true
  
  has_many :items 
  has_many :purchasers
end
