FactoryBot.define do
  factory :item do
    association :user
  
    name { Faker::Name.name }
    item_condition { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    shopping_charges_id { Faker::Number.between(from: 2, to: 3) }
    shopping_area_id { Faker::Number.between(from: 1, to: 47) }
    day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test123.png'), filename: 'test123.png')
    end
  end
end
