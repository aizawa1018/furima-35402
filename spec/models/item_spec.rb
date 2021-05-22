require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品入力' do

    it 'categoryが未選択だと出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
    end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it 'conditionが未選択だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it 'fare_idが未選択だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it 'days_idが未選択だと出品できない' do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it 'prideが未選択だと出品できない' do
        @item.pride = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it 'priceが全角数字だと出品できない' do
        @item.pride = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it 'titleが空だと出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it "title（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @item.title = "kana"
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      it "description（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @item.description = "kana"
        @item.valid?
        expect(@item.errors.full_messages).to include("Title 全角文字を使用してください")
      end
      
  end
end

