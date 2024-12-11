require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての情報が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end

    it '建物名が空でも購入できる' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では保存できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが正しい形式でないと保存できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it 'prefecture_idが0では保存できない' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'municipalityが空では購入できない' do
      @order_address.municipality = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'blockが空では保存できない' do
      @order_address.block = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end

    it 'telephone_numberが空では保存できない' do
      @order_address.telephone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'telephone_numberが10文字未満では保存できない' do
      @order_address.telephone_number = '090123456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Telephone number is too short')
    end

    it '電話番号が12桁以上だと購入できない' do
      @order_address.telephone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Telephone number is invalid. Input only number')
    end

    it '電話番号が半角数字以外が含まれている場合は購入できない' do
      @order_address.telephone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Telephone number is invalid. Input only number')
    end

    it 'tokenが空では保存できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では保存できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end