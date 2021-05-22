class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(furima_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    
  end

private
def hurima_params
  params.require(:hurima).permit(:user, :category_id, :fare_id, :condition_id,:days_id, :prefecture_id, :title, :description,:price)
end
end
