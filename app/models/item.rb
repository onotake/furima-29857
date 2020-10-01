class Item < ApplicationRecord
  belongs_to       :user
  has_one          :purchaser
  has_one_attached :image

  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :description,  length: { maximum: 1000 }
    validates :price,        numericality: { greater_than: 300, less_than: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :category_id,      numericality: { other_than: 1 }
    validates :condition_id,     numericality: { other_than: 1 }
    validates :delivery_fee_id,  numericality: { other_than: 1 }
    validates :delivery_area_id, numericality: { other_than: 0 }
    validates :day_id,           numericality: { other_than: 1 }
  end
end
