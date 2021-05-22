FactoryBot.define do
  factory :item do
    image             {Faker::Lorem.sentence}
    category_id      {1}
    fare_id          {1}
    condition_id     {1}
    days_id          {1}
    prefecture_id    {1}
    title            {Faker::Lorem.sentence}
    description      {Faker::Lorem.sentence}
    pride            {"9999999"}
  end
end
