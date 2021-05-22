class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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
end
