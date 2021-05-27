FactoryBot.define do
  factory :buyer_order do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    phone_number { '12345678911' }
    building_name{'東京ビル'}
    address {1-1-1}
    token {'決済'}
  end
end
