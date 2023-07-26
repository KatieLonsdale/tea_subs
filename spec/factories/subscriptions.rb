FactoryBot.define do
  factory :subscription do
    association :customer
    title { Faker::Tea.variety }
    price { Faker::Commerce.price(range:5..15, as_string: true) }
    status { rand(0..1) }
    frequency { ['monthly', 'yearly'].sample }
  end
end