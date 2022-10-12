require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '正常に登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録出来ない時' do
      it '商品の状態が空であれば登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品名が空であれば登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品のカテゴリーが空であれば登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品が空であれば登録できない' do
        @item.products = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Products can't be blank")
      end
      it '配送日数が空であれば登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '都道府県名が空であれば登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '販売価格が空であれば登録できない' do
        @item.product_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price can't be blank")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '価格は、¥300以下は登録できないこと' do
        @item.product_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price must be greater than or equal to 300")
      end
      it '価格は、¥9999999以上は登録できないこと' do
        @item.product_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price must be less than or equal to 9999999")
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.product_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price is not a number")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
    end
  end
end