FactoryBot.define do
  factory :token do
    post_number      { '123-4566' }
    shipping_origin_area_id { '2' }
    city    { '八王子市' }
    address   { '1-1' }
    building_name  { '丸の内' }
    tel   { '09012345678' }
    token   { '1111111111111111' }
  end
end