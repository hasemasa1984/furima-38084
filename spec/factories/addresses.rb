FactoryBot.define do
  factory :address do
    zip_code         {"1234567"}
    city             {"city_1"}
    number           {"number_1"}
    building         {"building_1"}
    last_name        {"出品"}
    first_name       {"太郎"}
    telephone_number {"03-1234-5678"}

    
    association :area, factory: :seller_area
    association :user, factory: :seller

  end

  
  
  factory :buyer_address, class: Address do

    zip_code         {"3214567"}
    addr_city        {"addr_city_2"}
    number           {"number_2"}
    building         {"building_2"}
    last_name        {"購入"}
    first_name       {"次郎"}
    last_name_kana   {"ジロウ"}
    first_name_kana  {"コウニュウ"}
    telephone_number {"03-1234-5678"}

    
    association :area, factory: :buyer_area
    association :user, factory: :buyer

  end
end
