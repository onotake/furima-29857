class PurchaserAddress

  include ActiveModel::Model
  attr_accessor :token, :post_code, :municipality, :address, :building_name, :phone_number, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code,     format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" } 
    validates :municipality
    validates :address
    validates :phone_number,  length: { maximum: 11 }, format: {with: /\A[0-9]+\z/}
    validates :token
  end

  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
    Address.create!(purchaser_id: purchaser.id, post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end