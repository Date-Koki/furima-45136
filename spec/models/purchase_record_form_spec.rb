require 'rails_helper'

RSpec.describe PurchaseRecordForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @form = FactoryBot.build(:purchase_record_form, user_id: @user.id, item_id: [@item.id])
  end

  describe '購入者情報登録' do
    context '購入できる場合' do
      it '必須項目が入力できている' do
        expect(@form).to be_valid
      end

      it 'building_nameは空欄でも購入できる' do
        @form.building_name = ''
        expect(@form).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postcodeが空だと購入できない' do
        @form.postcode = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeにハイフンがないと購入できない' do
        @form.postcode = '1234567'
        @form.valid?
        expect(@form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'prefectureが空だと購入できない' do
        @form.prefecture_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空だと購入できない' do
        @form.municipality = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'street_addressが空だと購入できない' do
        @form.street_address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Street address can't be blank")
      end

      it 'telephone_numberが空だと購入できない' do
        @form.telephone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが10字未満だと購入できない' do
        @form.telephone_number = '123456789'
        @form.valid?
        expect(@form.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'telephone_numberがハイフンがあると購入できない' do
        @form.telephone_number = '123-456-789'
        @form.valid?
        expect(@form.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'telephone_numberが半角数字でないと購入できない' do
        @form.telephone_number = '１２３４５６７８９'
        @form.valid?
        expect(@form.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'telephone_numberが12字以上だと購入できない' do
        @form.telephone_number = '123456789012'
        @form.valid?
        expect(@form.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'userが紐づいてないと購入できない' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいてないと購入できない' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空だと購入できない' do
        @form.token = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
