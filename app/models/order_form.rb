 class Order
  include ActiveModel::Model 
  attr_accessor :zipcode, :prefecture_id, :addr_city, :addr_num, :building, :phone_number, :user_id, :item_id,:token  
 
  with_options presence: true do 
    validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "例）123-4567"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :addr_city
    validates :addr_num
    validates :building
    validates :phone_number, format: {with: /\d{10,11}/}, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :item_id
  end       

  def save 
    order_item = OrderItem.create(user_id:user_id, item_id:item_id)
    Deliver.create(post_code:post_code, prefecture_id:prefecture_id, city:city, address:address,building:building,phone_number:phone_number, order_item_id:order_item.id)
  end  
end