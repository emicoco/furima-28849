FactoryBot.define do
  factory :item do
    name                    { 'あああ' }
    description             { 'あああ' }
    user_id                 { 123 }
    price                   { 311 }
    category_id             { 1 }
    status_id               { 1 }
    shipping_method_id      { 1 }
    shipping_origin_area_id { 1 }
    shipping_days_id        { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
