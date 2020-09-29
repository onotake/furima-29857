class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name, length: {maximum: 40},                                format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
    validates :description,  length: {maximum: 1000},                              format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
    validates :price,        numericality: {greater_than: 300, less_than:9999999}, format: {with: /\A[0-9]+\z/}
  end

  belongs_to       :user
  has_one          :purchaser
  has_one_attached :image
end
