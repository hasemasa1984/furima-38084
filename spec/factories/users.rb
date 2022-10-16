FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { "g9" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { person.first.kanji }
    last_name { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
    birth_date { Faker::Date.backward }
  end
  factory :seller, class: User do
    sequence(:nickname)        { |i| "出品者_#{i}"}
    sequence(:email)           { |i| "seller_#{i}@test.com"}
    password                   {"00000000b"}
    last_name                  {"苗字"}
    first_name                 {"名前"}
    last_name_kana             {"ミョウジカナ"}
    first_name_kana            {"ナマエカナ"}
    birthday                   {"20190101"}
    telephone_number           {"1234567890"}
  end

  
  factory :buyer, class: User do
    sequence(:nickname)        { |i| "購入者_#{i}"}
    sequence(:email)           { |i| "byuer_#{i}@test.com"}
    password                   {"00000000c"}
    last_name                  {"苗字"}
    first_name                 {"名前"}
    last_name_kana             {"ミョウジ"}
    first_name_kana            {"ナマエ"}
    birthday                   {"20190101"}
    telephone_number           {"1234567890"}
  end
end
