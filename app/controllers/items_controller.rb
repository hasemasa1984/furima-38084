class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #binding.pry ※学習メモ用
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    
  end

  def update
    if @item.update(item_params)
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
      redirect_to root_path
    else
       redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :products, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :scheduled_delivery_id, :product_price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

