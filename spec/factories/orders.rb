FactoryBot.define do
  factory :order do
    scheduled_delivery_id      { 2 }
    product_price                 { 50000 }

    association :item

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/alejandro-escamilla-yC-Yzbqy7PY-unsplash.jpg'), filename: 'alejandro-escamilla-yC-Yzbqy7PY-unsplash.jpg')
    end
  end
end
