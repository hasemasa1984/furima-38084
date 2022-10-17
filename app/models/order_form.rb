 class OrderForm
  include ActiveModel::Model 
  attr_accessor :zipcode, :prefecture_id, :addr_city, :addr_num, :building, :phone_number, :user_id, :item_id,:token  
 
  with_options presence: true do 
    validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "例）123-4567"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :addr_city
    validates :addr_num
    validates :phone_number, format: {with: /\d{10,11}/}, length: {maximum: 11}
    validates :user_id
    validates :item_id
  end
  
  validates :token,presence: true

  def save 
    order = Order.create(user_id:user_id, item_id:item_id)
    Address.create(zipcode:zipcode, prefecture_id:prefecture_id, addr_city:addr_city, addr_num:addr_num,building:building,phone_number:phone_number, order_id:order.id)
  end  
end