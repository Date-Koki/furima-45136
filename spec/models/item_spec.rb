require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品出品ができる' do
      it '全ての項目が入力できている' do
        expect(@item).to be_valid
      end

      it 'カテゴリーが「ーーー」以外であれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end

      it '商品の状態が「ーーー」以外であれば登録できる' do
        @item.status_id = 1
        expect(@item).to be_valid
      end

      it '配送料の負担が「ーーー」以外であれば登録できる' do
        @item.shipping_fee_id = 1
        expect(@item).to be_valid
      end

      it '発送元の地域が「ーーー」以外であれば登録できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end

      it '発送までの日数が「ーーー」以外であれば登録できる' do
        @item.delivery_time_id = 1
        expect(@item).to be_valid
      end

      it '価格が300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      context '商品出品ができない' do
        it 'ユーザー登録している人でないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
        end

        it '画像がないと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名がないと登録できない' do
          @item.product = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product can't be blank")
        end

        it '商品説明がないと登録できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'カテゴリーが「ーーー」だと登録できない' do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 0')
        end

        it '商品の状態が「ーーー」だと登録できない' do
          @item.status_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 0')
        end

        it '配送料の負担が「ーーー」だと登録できない' do
          @item.shipping_fee_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping fee must be other than 0')
        end

        it '発送元の地域が「ーーー」だと登録できない' do
          @item.prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
        end

        it '発送までの日数が「ーーー」だと登録できない' do
          @item.delivery_time_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery time must be other than 0')
        end

        it '価格が空欄だと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格の範囲が、300円未満だと出品できない' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it '価格の範囲が、9,999,999円を超えると出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
    end
  end
end
