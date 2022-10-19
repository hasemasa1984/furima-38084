FactoryBot.define do
  factory :item do
    title             { 'パソコン' }
    products           { '3年前に購入したMacBookです' }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_charge_id      { 2 }
    prefecture_id         { 2 }
    scheduled_delivery_id      { 2 }
    product_price                 { 50000 }

    association :user
   

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/alejandro-escamilla-yC-Yzbqy7PY-unsplash.jpg'), filename: 'alejandro-escamilla-yC-Yzbqy7PY-unsplash.jpg')
  end
  end
end

