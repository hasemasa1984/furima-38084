class OrderForm
  include ActiveModel::Model
 
  attr_accessor  :item
  validates :item, presence: true
  with_options presence: true do
    validates :products_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end

 
  def save
    Order.create(order: order)
    Item.create(item: item)
  end
 end