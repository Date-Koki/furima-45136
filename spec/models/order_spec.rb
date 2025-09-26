require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @order = FactoryBot.build(:item)
  end

  describe '購入者情報登録' do
    context '購入できる場合' do
      it '必須項目が入力できている' do
        expect(@order).to be_valid
      end

      it 'building_nameは空欄でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postcodeが空だと購入できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_message).to include("Postcode can't be blank")
      end

      it 'postcodeにハイフンがないと購入できない' do
        @order.postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_message).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'prefectureが空だと購入できない' do
        @order.prefecture = ''
        @order.valid?
        expect(@order.errors.full_message).to include("Prefecture can't be blank")
      end

      it 'municipalityが空だと購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_message).to include("Municipality  can't be blank")
      end

      it 'street_addressが空だと購入できない' do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_message).to include("Street address can't be blank")
      end

      it 'telephone_numberが空だと購入できない' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_message).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが10字未満だと購入できない' do
        @order.telephone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_message).to include('Telephone number is invalid')
      end

      it 'telephone_numberがハイフンがあると購入できない' do
        @order.telephone_number = '123-456-789'
        @order.valid?
        expect(@order.errors.full_message).to include('Telephone number is invalid')
      end

      it 'telephone_numberが半角数字でないと購入できない' do
        @order.telephone_number = '１２３４５６７８９'
        @order.valid?
        expect(@order.errors.full_message).to include('Telephone number is invalid')
      end

      it 'telephone_numberが12字以上だと購入できない' do
        @order.telephone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_message).to include('Telephone number is invalid')
      end

      it 'userが紐づいてないと購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_message).to include("User can't be blank")
      end

      it 'itemが紐づいてないと購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_message).to include("Item can't be blank")
      end

      it 'tokenが空だと購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_message).to include("Token can't be blank")
      end
    end
  end
end
