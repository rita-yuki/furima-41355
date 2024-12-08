require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  context '内容に問題ない場合' do
    it 'すべての情報が正しく入力されていれば保存できる' do
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

    it 'prefecture_idが空では保存できない' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
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

    it 'tokenが空では保存できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
