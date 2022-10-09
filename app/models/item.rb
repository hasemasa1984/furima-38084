class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :product_price
  
  

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture, numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_price, numericality: { other_than: 1 , message: "can't be blank"}


  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'この商品はありません' } do
    validates :title
    validates :products 
  end

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  belongs_to :user
  has_one :order

  has_one_attached :image

end
