require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it 'image、product_name、 description、 category_id、 condition_id、 delivery_fee_id、 delivery_area_id、 day_id、 priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくできないとき' do
      it 'ログインしていないユーザーが、出品ページへ遷移する' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it '出品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名がないと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが1を選択している場合出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'condition_idが1を選択している場合出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'delivery_fee_idが1を選択している場合出品できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'category_idが0を選択している場合出品できない' do
        @item.delivery_area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it 'day_idが1を選択している場合出品できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it '価格がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が半角数字でないと出品できない' do
        @item.price = '５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it '価格が299円以下のときに出品できない'do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300より大きい値にしてください")
      end
      it '価格が10000000円以上のときに出品できない'do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999より小さい値にしてください")
      end
    end
  end
end
