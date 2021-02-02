FactoryBot.define do
  factory :route do
    title        {Faker::Lorem.sentence}
    text         {Faker::Lorem.sentence}
    category_id  {1}
    city_id      {1}

    association :user

    after(:build) do |route|
      route.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
