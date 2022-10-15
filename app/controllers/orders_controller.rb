class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:product_price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:prefecture_id, :zipcode, :addr_city, :addr_num , :building,:phone_number).merge(order_id: @order.id)
  end
end
