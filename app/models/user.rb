class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         validates :nickname, presence: true
         validates :birth_date, presence: true
  
      

        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '名字と名前がそれぞれ必須であること' } do
          validates :first_name
          validates :last_name
        end

        
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
        

         validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }     
         validates :last_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }     
end
