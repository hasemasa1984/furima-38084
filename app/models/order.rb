class Order < ApplicationRecord
  

  belongs_to :item
  belongs_to :user
  has_one :address

  #validates :product_price, presence: true
  #validates :token, presence: true
end
