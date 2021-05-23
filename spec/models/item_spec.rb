require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品入力' do
    context '登録ができない時' do

    it 'categoryが未選択だと出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'conditionが未選択だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'fare_idが未選択だと出品できない' do
        @item.fare_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Fare must be other than 0")
      end
      it 'days_idが未選択だと出品できない' do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 0")
      end
      it 'prideが未選択だと出品できない' do
        @item.pride = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Pride is not a number")
      end
      it 'priceが全角数字だと出品できない' do
        @item.pride = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Pride is not a number")
      end
      it 'titleが空だと出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが設定範囲以外だと出品できない' do
        @item.pride = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Pride must be less than or equal to 9999999")
      end
      it '半角英数字混合では登録できないこと' do
        @item.pride = "abc123"
        @item.valid?
        expect(@item.errors.full_messages).to include("Pride is not a number")
      end
      it '半角英字では登録できないこと' do
        @item.pride = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Pride is not a number")
      end
      it 'priceが300円以下だと出品できない' do
        @item.pride = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Pride must be greater than or equal to 300')
      end

      context '登録ができる時' do
       it '全ての値が正しく入力されていれば出品できること' do
        @item = FactoryBot.create(:user)
         expect(@item).to be_valid
       end
      end

      
      
    end
  end
end

          