require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '正常に登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'test1234'
        @user.password_confirmation = "test1234"
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
        @user.first_name = '桐生'
        @user.last_name = 'ココ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'イオフィ'
        @user.last_name_kana = 'イナニス'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'カ'
        @user.last_name_kana = 'カ'
        @user.valid?
      end
      it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
        @user.first_name = ''
        @user.last_name = ''
        @user.valid?
      end
      it  'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password_confirmation = ''
        @user.valid?
      end
    end
    context '新規登録出来ない時' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('は半角英数を両方含む必要があります')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('は半角英数を両方含む必要があります')
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '生年月日が必須であること' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it "全角文字を含むパスワードでは登録できない" do
        @user.password = "AAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角で登録してください")
      end
      it "パスワードが6文字未満では登録できない" do
        user = build(:user, password: "123456", encrypted_password: "123456") # 意図的に6文字のパスワードを設定してエラーが出るかをテスト 
        user.valid?
        expect(user.errors[:encrypted_password]).to include("は7文字以上で入力してください")
      end
    end
  end
end
