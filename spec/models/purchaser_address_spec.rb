require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchaser_address = FactoryBot.build(:purchaser_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchaser_address).to be_valid
    end
    it '建物名が空でも購入ができること' do
      @purchaser_address.building_name = ""
      expect(@purchaser_address).to be_valid
    end
    it 'post_codeが空だと保存できないこと' do
      @purchaser_address.post_code = ""
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'post_codeにハイフンがないと保存できないこと' do
      @purchaser_address.post_code = "1234567"
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("郵便番号は不正な値です")
    end
    it 'post_codeが数字以外だと保存できないこと' do
      @purchaser_address.post_code = "郵便-番号"
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("郵便番号は不正な値です")
    end
    it 'prefecture_idが0だと保存できないこと' do
      @purchaser_address.prefecture_id = 0
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("都道府県を選択してください")
    end
    it 'addressが空だと保存できないこと' do
      @purchaser_address.address = ""
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("番地を入力してください")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchaser_address.phone_number = ""
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @purchaser_address.phone_number = "090123456789"
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end
    it 'phone_numberが数字以外だと保存できないこと' do
      @purchaser_address.phone_number = "電話番号"
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("電話番号は不正な値です")
    end
    it 'tokenが空だと保存できないこと' do
      @purchaser_address.token = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
  end
end
