FactoryBot.define do
  factory :order do
    postcode { '123-4567' }
    prefecture_id { 2 }
    municipality { '京都市緑区' }
    street_address { '青山1-1-1' }
    building_name { '柳ビル103' }
    telephone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
