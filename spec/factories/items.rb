FactoryBot.define do
  factory :item do
    association :user

    category_id      {1}
    fare_id          {1}
    condition_id     {1}
    days_id          {1}
    prefecture_id    {1}
    title            {Faker::Lorem.sentence}
    description      {Faker::Lorem.sentence}
    pride            {9999999}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
