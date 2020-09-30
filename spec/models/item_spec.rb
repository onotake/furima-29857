require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it "image、product_name、 description、 category_id、 condition_id、 delivery_fee_id、 delivery_area_id、 day_id、 priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくできないとき' do
      it "ログインしていないユーザーが、出品ページへ遷移する" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "出品画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "商品の説明がないと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが選択されていないと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が選択されていないと出品できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が選択されていないと出品できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "発送元の地域が選択されていないと出品できない" do
        @item.delivery_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it "発送までの日数が選択されていないと出品できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "価格がないと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が半角数字でないと出品できない" do
        @item.price = "５５５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end  