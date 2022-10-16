class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end


  def create
    @order = Order.new
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end  
  end

  private

  def order_params
    params.require(:item).permit(:zipcode, :prefecture_id, :addr_city, :addr_num, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end

  def address_params
    params.permit(:prefecture_id, :zipcode, :addr_city, :addr_num , :building,:phone_number).merge(order_id: @order.id)
  end
end
