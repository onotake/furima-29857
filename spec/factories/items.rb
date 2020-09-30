FactoryBot.define do
  factory :item do
    product_name     {"aa"}
    description      {"aa"}
    category_id      {Faker::Number.within(range: 2..11)}
    condition_id     {Faker::Number.within(range: 2..7)}
    delivery_fee_id  {Faker::Number.within(range: 2..3)}
    delivery_area_id {Faker::Number.within(range: 1..46)}
    day_id           {Faker::Number.within(range: 2..4)}
    price            {Faker::Number.within(range: 300..9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'test_image.png')
    end
  end
end
