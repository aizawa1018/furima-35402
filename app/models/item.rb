class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :pride, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :category
  belongs_to :condition
  belongs_to :day
  belongs_to :prefecture
  belongs_to :user
  belongs_to :fare
  has_one_attached :image


  with_options  numericality: { other_than: 0 } do
  validates :category_id
  validates :fare_id
  validates :condition_id
  validates :days_id
  validates :prefecture_id
  end


  with_options presence: true do
  validates :category_id
  validates :fare_id
  validates :condition_id
  validates :days_id
  validates :prefecture_id
  validates :title
  validates :description
  validates :pride
  validates :image


  end

  
end
