require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order = FactoryBot.build(:order_address)
    end

    it '全ての値が正しく入力されていれば保存されること' do
      expect(@order).to be_valid
    end
    it 'tokenが空だと保存ができないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存ができないこと' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存ができないこと' do
      @order.postal_code = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが空だと保存ができないこと' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存ができないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'streetが空だと保存ができないこと' do
      @order.street = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Street can't be blank")
    end
    it 'buildingが空でも保存ができること' do
      @order.building = nil
      expect(@order).to be_valid
    end
    it 'phone_numが空だと保存ができないこと' do
      @order.phone_num = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone num can't be blank")
    end
    it 'phone_numにハイフンがあると保存ができないこと' do
      @order.phone_num = '000-000-000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone num is invalid. Input half-width characters')
    end
    it 'phone_numが11文字以上だと保存ができないこと' do
      @order.phone_num = '000000000000000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone num is invalid. Input within 11 characters')
    end
  end
end
