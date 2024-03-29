FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    family_name { '佐藤' }
    first_name { '早紀' }
    family_name_kana { 'サトウ' }
    first_name_kana { 'サキ' }
    birth_day { Faker::Date.birthday }
  end
end
