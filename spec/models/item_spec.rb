require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample.jpg', 'image/jpeg')
    end

    it '全ての項目に入力されていれば' do
      expect(@item).to be_valid
    end

    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'infoが空だと登録できない' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'category_idが空だと登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'category_idの値が1だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category リストから選択してください')
    end

    it 'status_idが空だと登録できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'status_idの値が1だと登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status リストから選択してください')
    end

    it 'delivery_fee_idが空だと登録できない' do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it 'delivery_fee_idの値が1だと登録できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee リストから選択してください')
    end

    it 'shipping_area_idが空だと登録できない' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it 'shipping_area_idの値が1だと登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping area リストから選択してください')
    end

    it 'shipping_days_idが空だと登録できない' do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end

    it 'shipping_days_idの値が1だと登録できない' do
      @item.shipping_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping days リストから選択してください')
    end

    it 'priceが空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300円未満だと登録できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 指定内の金額を入力してください')
    end

    it 'priceが10000000円以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 指定内の金額を入力してください')
    end

    it 'priceが半角数字以外だと登録できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 指定内の金額を入力してください')
    end
  end
end
