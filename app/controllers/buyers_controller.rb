class BuyersController < ApplicationController
  before_action :set_buyers, only:[:index, :create]

  def index
     @buyer_order = BuyerOrder.new
  end

  def create
    @buyer_order = BuyerOrder.new(buyer_params)
    if @buyer_order.valid?
      pay_item
       @buyer_order.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.require(:buyer_order).permit(:post_code, :address ,:city, :phone_number, :building_name, :prefecture_id).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_buyers
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_fdda5bbc68aa71f7f5d473b0"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.pride,  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
