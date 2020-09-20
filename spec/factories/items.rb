FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.sentence}
    text               {Faker::Lorem.sentence}
    category_id        {2}
    status_id          {2}
    shipping_cost_id   {2}
    area_id            {2}
    shipping_time_id   {2}
    price              {Faker::Number.between(300,9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
