FactoryBot.define do
  factory :order do
    item                 { 50000 }
    token {"tok_abcdefghijk00000000000000000"}
    #after(:build) do |item|
      #item.image.attach(io: File.open('public/images/alejandro-escamilla-yC-Yzbqy7PY-unsplash.jpg'), filename: 'alejandro-escamilla-yC-Yzbqy7PY-unsplash.jpg')
    #end
  end
end
