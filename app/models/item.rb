class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :pride, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :day
  belongs_to :Prefecture
  has_one_attached :image

  

  with_options presence: true do
  validates :category_id
  validates :fare_id
  validates :condition_id
  validates :days_id
  validates :prefecture_id
  validates :title
  validates :description
  validates :pride
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :title
    validates :description
  end
end
