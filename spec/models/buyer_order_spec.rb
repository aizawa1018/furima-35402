require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  before do
    @buyer_order = FactoryBot.build(:buyer_order)
    user = FactoryBot.create(:user)
    item =FactoryBot.create(:item)
    sleep(1)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_order).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @buyer_order.building_name = nil
      expect(@buyer_order).to be_valid
    end
  end

  context '登録ができない時' do
    it 'postal_codeが空だと保存できないこと' do
      @buyer_order.post_code = nil
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buyer_order.post_code = '1234567'
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @buyer_order.prefecture_id = 0
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "phone_numberを選択していないと保存できないこと" do
      @buyer_order.phone_number = 0
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Phone number is invalid.")
    end
    it "post_codeにhyphen(-)がないとしていないと保存できないこと" do
      @buyer_order.post_code = 0
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "cityを選択していないと保存できないこと" do
      @buyer_order.city = 0
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("City is invalid. Input full-width characters.")
    end
    it "address を選択していないと保存できないこと" do
      @buyer_order.address  = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Address can't be blank")
    end
    it "rokenがないと保存できないこと" do
      @buyer_order.token  = ""
      @buyer_order.valid?
      expect(@buyer_order.errors.full_messages).to include("Token can't be blank", "User can't be blank")
    end

  end
end
