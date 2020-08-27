FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence}
    price { '5000' }
    category_id { '0' }
    sipping_id { '0' }
    sipping_origin_id { '0' }
    sipping_date_id { '0' }
    status_id { '0' }

    association :user
  end
end
