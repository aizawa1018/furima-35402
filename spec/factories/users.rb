FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'abc123'}
    password_confirmation {'abc123'}
    first_name            {'佐藤'}
    last_name             {'太郎'}
    first_name_kana       {'テスト'}
    last_name_kana        {'テスト'}
    birthday              { Faker::Date.backward }
  end
end