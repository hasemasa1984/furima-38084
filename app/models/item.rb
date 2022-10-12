class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  
  

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}


  with_options presence: true, format: { with: /\A[0-9]+\z/ } do 
    validates :product_price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }  
  end

  #def images_presence
    #if images.attached?
      #if images.length > 1
        #errors.add(:image, '1枚まで投稿できます')
      #end
    #else
      #errors.add(:image, '画像がありません')
    #end
  #end

  validates :products,presence: true
  validates :title,presence: true
  validates :image,presence: true


  belongs_to :user
  #has_one :order

  has_one_attached :image

end
