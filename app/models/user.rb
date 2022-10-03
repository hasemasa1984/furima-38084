class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presence: true
         validates :first_name, presence: true
         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :first_name_kana, presence: true
         validates :last_name_kana, presence: true
         validates :birth_date, presence: true
  
        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
         validates :first_name
         validates :last_name
         validates :first_name_kana
         validates :last_name_kana
        end

        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '名字と名前がそれぞれ必須であること' } do
          validates :first_name
          validates :last_name
        end

        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'First name kana Last name kana 全角カタカナで入力して下さい' } do
          validates :first_name_kana
          validates :last_name_kana
        end
        #PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         #validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
        

        validates :nickname,               presence: true
        validates :encrypted_password,     presence: true, length: { minimum: 7 } 
        validates :first_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
        validates :first_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
        validates :last_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
        validates :last_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }     

end
