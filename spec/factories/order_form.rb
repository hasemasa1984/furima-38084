FactoryBot.define do
  factory :order_form do
    zipcode { '123-4567' }
    prefecture_id { 1 }
    addr_city { '東京都' }
    addr_num { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' } 
    token {'4434343'}

   
  end
end
