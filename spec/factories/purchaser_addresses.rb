FactoryBot.define do
  factory :purchaser_address do
    post_code {"123-4567"}
    prefecture_id {1}
    municipality {"市区町村"}
    address {"青山1-1-1"}
    building_name {"マンション"}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
