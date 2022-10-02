require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank") 
    end
    it  'メールアドレスが必須であること' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it  'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end 
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it   'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too long (maximum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.name = 'first-name and last-name'
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.name = 'first-name-kana and last-name-kana'
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
      @user.name = 'first-name-kana and last-name-kana'
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.name = 'first-name-kana and last-name-kana'
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it '生年月日が必須であること' do
      @user.birth_date = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birth_date can't be blank")
    end
  end
end
