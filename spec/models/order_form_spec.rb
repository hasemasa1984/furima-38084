require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_form = FactoryBot.build(:order_form, item_id: item.id, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it "内容に問題がなければ保存ができること" do
      expect(@order_form).to be_valid
    end
    it "建物名の入力がなくても登録できること" do
      @order_form.building = ''
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenの値が空であれば保存ができないこと" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号を入力してない場合は保存できないこと" do
    @order_form.zipcode = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Zipcode can't be blank")
    end
    it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
     @order_form.zipcode = '1234-567'
     @order_form.valid?
     expect(@order_form.errors.full_messages).to include("Zipcode 例）123-4567")
    end
    it "都道府県が選択されてないと登録できない" do
      @order_form.prefecture_id = 0
     @order_form.valid?
     expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市区町村が入力されてないと登録できない" do
      @order_form.addr_city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Addr city can't be blank")
    end
    it "番地が入力されてないと登録できない" do
      @order_form.addr_num = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Addr num can't be blank")
    end
    it "電話番号が無い場合は保存できないこと" do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号が12桁以上では購入できないこと" do
      @order_form.phone_number = '090123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it "電話番号が9桁以下では購入できないこと" do
      @order_form.phone_number = '090123456'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号に半角数字以外が含まれている場合は購入できない" do
      @order_form.phone_number = '０９０１２３４５６７８'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'ユーザーが紐づいていないと登録できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐づいていないと登録できない' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
