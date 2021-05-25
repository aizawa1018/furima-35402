class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit,:update]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(items_param)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless @item.user_id == current_user.id
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
     end
      redirect_to root_path
  end

  

private
def item_params
  params.require(:item).permit(:user, :category_id, :fare_id, :condition_id,:days_id, :prefecture_id, :title, :description,:pride, :image).merge(user_id: current_user.id)
end


def set_item
  @item = Item.find(params[:id])
end


end
