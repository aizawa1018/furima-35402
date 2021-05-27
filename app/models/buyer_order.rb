class BuyerOrder
 include ActiveModel::Model
  attr_accessor :first_name, :order_history, :post_code, :address, :prefecture_id, :city, :building_name, :phone_number, :user_id, :item_id,:token

  with_options presence: true do
   validates :post_code        ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :address         
   validates :city             ,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
   validates :phone_number     ,format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
   validates :token
  end
  validates :prefecture_id    ,numericality: { other_than: 0, message: "can't be blank" } 


  def save
    buyer_order = OrderHistory.create(user_id: user_id, item_id: item_id)
                  Buyer.create(order_history: order_history, post_code: post_code, address: address,building_name: building_name, prefecture_id: prefecture_id, city: city, phone_number: phone_number)
  
    end

end


