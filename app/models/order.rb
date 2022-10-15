class Order < ApplicationRecord

  belongs_to :item
  belongs_to :user
  has_one :address
  validates :product_price, presence: true, numericality: {only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is invalid"}
end
