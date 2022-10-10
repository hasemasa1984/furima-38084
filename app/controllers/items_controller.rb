class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :new,:create]
  #before_action :set_item, only: [:edit, :update, :show, :destroy]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if current_user.id == @item.user_id
       @item.destroy
      end
       redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :products, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :scheduled_delivery_id, :product_price_id, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
