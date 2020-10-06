class PurchaserAddress

  include ActiveModel::Model
  attr_accessor :token, :post_code, :municipality, :address, :building_name, :phone_number, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :address
    validates :building_name
    validates :phone_number, length: { maximum: 11 }, format: {with: /\A[0-9]+\z/}
    validates :token
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 0 } 

  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
    Address.create!(purchaser_id: purchaser.id, post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end