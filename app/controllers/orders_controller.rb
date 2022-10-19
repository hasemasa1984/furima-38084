class OrdersController < ApplicationController
  before_action :authenticate_user! 
  #before_action :set_item, only: [:index, :create]
  

  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path 
    end
  end


  def create
    
    @order_form = OrderForm.new(order_form_params)
    @item = Item.find(params[:item_id])
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render 'index'
    end  
  end

  private

  def order_form_params
    params.require(:order_form).permit(:zipcode, :prefecture_id, :addr_city, :addr_num, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.product_price,
        card: order_form_params[:token],    
        currency: 'jpy'                 
      )
  end

  
  #def set_item
    #@item = Item.find(params[:id])
  #end
end
