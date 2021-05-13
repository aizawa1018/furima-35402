class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validetas :nickname,        presence: true
         validetas :first_name,      presence: true
         validetas :last_name,       presence: true
         validetas :first_name_kana, presence: true
         validetas :last_name_kana,  presence: true
         validetas :birthday,        presence: true

         has_many :items
         has_many :order_historys
end
