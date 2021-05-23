class ItemsController < ApplicationController
  #before_action :authenticate_user!, except: [:index]
  def index
    #@items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  

private
def item_params
  params.require(:item).permit(:user, :category_id, :fare_id, :condition_id,:days_id, :prefecture_id, :title, :description,:pride)
end
end
