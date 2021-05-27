class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :contributor_confirmation, only: [:edit, :update,:destroy]

  def index
    @items = Item.all.order("created_at DESC")
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
    if @item.destroy
      redirect_to root_path
    end
  end

private
def item_params
  params.require(:item).permit(:user, :category_id, :fare_id, :condition_id,:days_id, :prefecture_id, :title, :description,:pride, :image).merge(user_id: current_user.id)
end


def set_item
  @item = Item.find(params[:id])
end

def contributor_confirmation
  redirect_to root_path unless current_user == @prototype.user
end

end
